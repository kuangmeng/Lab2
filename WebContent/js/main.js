(function($angular, _) {
  'use strict';
  var _prefix = 'hullabaloo';
  var _p1 = 'me';
  var _p2 = 'spock';
  var randum = function(max) {
    return Math.round(Math.random() * max);
  }

  var hexify = function(x) {
    return ('0' + parseInt(x).toString(16)).slice(-2);
  }

  var randex = function() {
    return '#' + hexify(randum(255)) + hexify(randum(255)) + hexify(randum(255));
  };

  var blender = function() {
    if (!!Math.round(Math.random())) {
      return 'radial-gradient(circle at ' + randum(100) + '% ' + randum(100) + '%, ' + randex() + ', ' + randex() + ')';
    } else {
      return 'linear-gradient(' + randum(360) + 'deg, ' + randex() + ', ' + randex() + ')';
    }
  };

  $angular.module('app', [])
    .run(['StorageService', function(storage) {
      var data = storage.get(_prefix);
      if (!data) {
        storage.save(_prefix, {
          me: 0,
          spock: 0
        });
      }
    }])
    .controller('ctrl', ['$scope', '$timeout', 'StorageService', function($scope, $timeout, storage) {
      var splashIconArray = [];
      splashIconArray = _.flatten(_.times(29, function(i) {
        var _arr = ['rock', 'paper', 'scissors'];
        if (i % 9 === 0) {
          _arr.push('spock');
        }
        return _arr;
      }));
  
      var init = function(){
        $scope.spocked = false;
        $scope.answered = false;
        $scope.score = storage.get(_prefix);
        $scope.b = blender();
      };

      var _recordScore = function(winner) {
        var _myScore = parseInt($scope.score.me),
          _spockScore = parseInt($scope.score.spock),
          _prefs;

        if (winner === _p1) {
          _myScore = parseInt($scope.score.me) + 1;
        }
        if (winner === _p2) {
          _spockScore = parseInt($scope.score.spock) + 1;
        }
        var _score = {
          me: _myScore,
          spock: _spockScore
        };
        storage.save(_prefix, _score);
        return _score;
      };

      $scope.uiPlay = function(hand) {
        if ($scope.answered) {
          return;
        }

        var _winner = false;
        var message = '';
        $scope.splashIcon = splashIconArray[_.random(0, splashIconArray.length - 1)];

        $scope.answered = hand;
        if ($scope.splashIcon === 'spock') {
          $scope.spocked = true;
          _winner = _p2;
          message = 'You\'ve been Spock\'d';
        } else {
          if (hand === $scope.splashIcon) {
            _winner = 'tie';
            message = 'It\'s a tie!';
          } else {
            if (hand === 'rock' && $scope.splashIcon === 'scissors' || hand === 'scissors' && $scope.splashIcon === 'paper' || hand === 'paper' && $scope.splashIcon === 'rock') {
              _winner = _p1;
              message = 'You won!';
            } else {
              _winner = _p2;
              message = 'You lost.';
            }
          }
        }
        if (_winner !== 'tie') {
          $scope.score = _recordScore(_winner);
        }
        $scope.winner = _winner;
        $scope.message = message;
      };

      $scope.uiSetMoveClasses = function(hand, n) {
        var classes = [];
        if ($scope.answered === hand) {
          classes.push('bg-dark');
          classes.push('answered');
          if ($scope.winner === _p1) {
            classes.push('winner');
          }
        } else if (!$scope.answered) {
          classes.push('bg-light');
          classes.push('beacon-' + n);
        }
        return classes.join(' ');
      };
  
      $scope.uiPlayAgain = function() {
        init();
      };
  
      init();
    }])
    .factory('StorageService', [function() {
      // get item out of local storage and if it's a string, turn it into a json object
      var get = function(key) {
        var item = window.localStorage.getItem(key);
        if (item && _.isString(item) && _.isEmpty(item) === false) {
          return $angular.fromJson(item);
        } else {
          return item;
        }
      };

      // save object as a json string
      var save = function(key, data) {
        window.localStorage.setItem(key, $angular.toJson(data));
      };
      // remove a specific item
      var remove = function(key) {
        window.localStorage.removeItem(key);
      };
      // blow them all away
      var clearAll = function() {
        window.localStorage.clear();
      };

      // Return array of keys for local storage
      // Example use: var keys = StorageService.keys()
      var keys = function(filter) {
        var prefix = _prefix + (filter || '');
        var prefixLength = prefix.length;
        var keys = [];
        for (var key in window.localStorage) {
          // Only return keys that are for this app
          if (key.substr(0, prefixLength) === prefix) {
            try {
              keys.push(key.substr(prefixLength + 1));
            } catch (e) {
              return [];
            }
          }
        }
        return keys;
      };

      return {
        get: get,
        save: save,
        remove: remove,
        clearAll: clearAll,
        keys: keys
      };
    }]);

})(window.angular, window._);