
var img_src = "/images/a1.png";
var img_bg = '/images/a2.png';

//struct
function Point() {
    this.X = 0;
    this.Y = 0;
}

function SEQUENCE(size) {
    this.Index = 0;

    this.Titles = new Array(size);
    for (var i = 0; i < this.Titles.length; i++) {
        this.Titles[i] = 0;
    }

    this.Steps = new Array(size);
    for (var i = 0; i < this.Steps.length; i++) {
        this.Steps[i] = new Point();
    }
}

function PATH() {
    this.Start = new Point();
    this.End = new Point();
    this.MidOne = new Point();
    this.MidTwo = new Point();

    this.GetStart = function () {
        var tStart = new Point();
        tStart.X = this.Start.X;
        tStart.Y = this.Start.Y;
        return tStart;
    }
    this.GetEnd = function () {
        var tEnd = new Point();
        tEnd.X = this.End.X;
        tEnd.Y = this.End.Y;
        return tEnd;
    }
    this.GetMidOne = function () {
        var tMidOne = new Point();
        tMidOne.X = this.MidOne.X;
        tMidOne.Y = this.MidOne.Y;
        return tMidOne;
    }
    this.GetMidTwo = function () {
        var tMidTwo = new Point();
        tMidTwo.X = this.MidTwo.X;
        tMidTwo.Y = this.MidTwo.Y;
        return tMidTwo;
    }
}

function Board() {
    var _w = 0;
    var _h = 0;
    var _faceNum = 0;
    var _boardsize = null;
    var _sequence = null;
    this.FaceItems = null;

    this.Init = function (w, h, faceNum) {
        _w = w;
        _h = h;
        _faceNum = faceNum;

        _boardsize = new Point();
        _boardsize.X = _w + 2;
        _boardsize.Y = _h + 2;

        _sequence = new SEQUENCE(_w * _h / 2);

        this.FaceItems = new Array(_boardsize.X);
        for (var i = 0; i < this.FaceItems.length; i++) {
            this.FaceItems[i] = new Array(_boardsize.Y);
            for (var j = 0; j < this.FaceItems[i].length; j++) {
                this.FaceItems[i][j] = 0;
            }
        }

    }

    this.IsFit = function (path) {
        var point1 = path.GetStart();
        var point2 = path.GetEnd();

        var i = 0;
        if ((this.FaceItems[point1.X][point1.Y] == 0 || this.FaceItems[point2.X][point2.Y] == 0)
                || (this.FaceItems[point1.X][point1.Y] != this.FaceItems[point2.X][point2.Y])) return false;
        if (point1.X == point2.X) {
            if (point1.Y < point2.Y) {
                if (point1.Y == point2.Y - 1) {
                    path.MidOne = path.GetStart();
                    path.MidTwo = path.GetStart();
                    return true;
                }
                for (i = point1.Y + 1; i < point2.Y; i++) {
                    if (this.FaceItems[point1.X][i] != 0) break;
                    if (i == point2.Y - 1) {
                        path.MidOne = path.GetStart();
                        path.MidTwo = path.GetStart();
                        return true;
                    }
                }
                for (i = point1.X + 1; i < _boardsize.X; i++) {
                    if (this.FaceItems[i][point1.Y] != 0) break;
                    for (var j = point1.Y + 1; j <= point2.Y; j++) {
                        if (this.FaceItems[i][j] != 0) break;
                        if (j == point2.Y) {
                            for (var k = i; k > point1.X; k--) {
                                if (this.FaceItems[k][j] != 0) break;
                                if (k == point1.X + 1) {
                                    path.MidOne.X = i;
                                    path.MidOne.Y = point1.Y;
                                    path.MidTwo.X = i;
                                    path.MidTwo.Y = point2.Y;
                                    return true;
                                }
                            }
                        }
                    }
                }
                for (i = point1.X - 1; i >= 0; i--) {
                    if (this.FaceItems[i][point1.Y] != 0) return false;
                    for (var j = point1.Y + 1; j <= point2.Y; j++) {
                        if (this.FaceItems[i][j] != 0) break;
                        if (j == point2.Y) {
                            for (var k = i; k < point1.X; k++) {
                                if (this.FaceItems[k][j] != 0) break;
                                if (k == point1.X - 1) {
                                    path.MidOne.X = i;
                                    path.MidOne.Y = point1.Y;
                                    path.MidTwo.X = i;
                                    path.MidTwo.Y = point2.Y;
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
            else if (point1.Y > point2.Y) {
                if (point1.Y == point2.Y + 1) {
                    path.MidOne = path.GetStart();
                    path.MidTwo = path.GetStart();
                    return true;
                }
                for (i = point1.Y - 1; i > point2.Y; i--) {
                    if (this.FaceItems[point1.X][i] != 0) break;
                    if (i == point2.Y + 1) {
                        path.MidOne = path.GetStart();
                        path.MidTwo = path.GetStart();
                        return true;
                    }
                }
                for (i = point1.X + 1; i < _boardsize.X; i++) {
                    if (this.FaceItems[i][point1.Y] != 0) break;
                    for (var j = point1.Y - 1; j >= point2.Y; j--) {
                        if (this.FaceItems[i][j] != 0) break;
                        if (j == point2.Y) {
                            for (var k = i; k > point1.X; k--) {
                                if (this.FaceItems[k][j] != 0) break;
                                if (k == point1.X + 1) {
                                    path.MidOne.X = i;
                                    path.MidOne.Y = point1.Y;
                                    path.MidTwo.X = i;
                                    path.MidTwo.Y = point2.Y;
                                    return true;
                                }
                            }
                        }
                    }
                }
                for (i = point1.X - 1; i >= 0; i--) {
                    if (this.FaceItems[i][point1.Y] != 0) return false;
                    for (var j = point1.Y - 1; j >= point2.Y; j--) {
                        if (this.FaceItems[i][j] != 0) break;
                        if (j == point2.Y) {
                            for (var k = i; k < point1.X; k++) {
                                if (this.FaceItems[k][j] != 0) break;
                                if (k == point1.X - 1) {
                                    path.MidOne.X = i;
                                    path.MidOne.Y = point1.Y;
                                    path.MidTwo.X = i;
                                    path.MidTwo.Y = point2.Y;
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
        }
        else if (point1.X < point2.X) {
            if (point1.Y == point2.Y) {
                if (point1.X == point2.X - 1) {
                    path.MidOne = path.GetStart();
                    path.MidTwo = path.GetStart();
                    return true;
                }
                for (i = point1.X + 1; i < point2.X; i++) {
                    if (this.FaceItems[i][point1.Y] != 0) break;
                    if (i == point2.X - 1) {
                        path.MidOne = path.GetStart();
                        path.MidTwo = path.GetStart();
                        return true;
                    }
                }
                for (i = point1.Y + 1; i < _boardsize.Y; i++) {
                    if (this.FaceItems[point1.X][i] != 0) break;
                    for (var j = point1.X + 1; j <= point2.X; j++) {
                        if (this.FaceItems[j][i] != 0) break;
                        if (j == point2.X) {
                            for (var k = i; k > point1.Y; k--) {
                                if (this.FaceItems[j][k] != 0) break;
                                if (k == point1.Y + 1) {
                                    path.MidOne.X = point1.X;
                                    path.MidOne.Y = i;
                                    path.MidTwo.X = point2.X;
                                    path.MidTwo.Y = i;
                                    return true;
                                }
                            }
                        }
                    }
                }
                for (i = point1.Y - 1; i >= 0; i--) {
                    if (this.FaceItems[point1.X][i] != 0) return false;
                    for (var j = point1.X + 1; j <= point2.X; j++) {
                        if (this.FaceItems[j][i] != 0) break;
                        if (j == point2.X) {
                            for (var k = i; k < point1.Y; k++) {
                                if (this.FaceItems[j][k] != 0) break;
                                if (k == point1.Y - 1) {
                                    path.MidOne.X = point1.X;
                                    path.MidOne.Y = i;
                                    path.MidTwo.X = point2.X;
                                    path.MidTwo.Y = i;
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
            else if (point1.Y < point2.Y) {
                for (i = point1.Y + 1; i <= point2.Y; i++) {
                    if (this.FaceItems[point1.X][i] != 0) break;
                    if (i == point2.Y) {
                        for (var j = point1.X; j < point2.X; j++) {
                            if (this.FaceItems[j][i] != 0) break;
                            if (j == point2.X - 1) {
                                path.MidOne.X = point1.X;
                                path.MidOne.Y = point2.Y;
                                path.MidTwo = path.GetMidOne();
                                return true;
                            }
                        }
                    }
                }
                for (i = point1.X + 1; i <= point2.X; i++) {
                    if (this.FaceItems[i][point1.Y] != 0) break;
                    if (i == point2.X) {
                        for (var j = point1.Y; j < point2.Y; j++) {
                            if (this.FaceItems[i][j] != 0) break;
                            if (j == point2.Y - 1) {
                                path.MidOne.X = point2.X;
                                path.MidOne.Y = point1.Y;
                                path.MidTwo = path.GetMidOne();
                                return true;
                            }
                        }
                    }
                }
                for (i = point1.Y + 1; i < _boardsize.Y; i++) {
                    if (this.FaceItems[point1.X][i] != 0) break;
                    for (var j = point1.X; j <= point2.X; j++) {
                        if (this.FaceItems[j][i] != 0) break;
                        if (j == point2.X) {
                            if (i < point2.Y) {
                                for (var k = i; k < point2.Y; k++) {
                                    if (this.FaceItems[j][k] != 0) break;
                                    if (k == point2.Y - 1) {
                                        path.MidOne.X = point1.X;
                                        path.MidOne.Y = i;
                                        path.MidTwo.X = point2.X;
                                        path.MidTwo.Y = i;
                                        return true;
                                    }
                                }
                            }
                            else {
                                for (var k = i; k > point2.Y; k--) {
                                    if (this.FaceItems[j][k] != 0) break;
                                    if (k == point2.Y + 1) {
                                        path.MidOne.X = point1.X;
                                        path.MidOne.Y = i;
                                        path.MidTwo.X = point2.X;
                                        path.MidTwo.Y = i;
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
                for (i = point1.Y - 1; i >= 0; i--) {
                    if (this.FaceItems[point1.X][i] != 0) break;
                    for (var j = point1.X; j <= point2.X; j++) {
                        if (this.FaceItems[j][i] != 0) break;
                        if (j == point2.X) {
                            for (var k = i; k < point2.Y; k++) {
                                if (this.FaceItems[j][k] != 0) break;
                                if (k == point2.Y - 1) {
                                    path.MidOne.X = point1.X;
                                    path.MidOne.Y = i;
                                    path.MidTwo.X = point2.X;
                                    path.MidTwo.Y = i;
                                    return true;
                                }
                            }
                        }
                    }
                }
                for (i = point1.X + 1; i < _boardsize.X; i++) {
                    if (this.FaceItems[i][point1.Y] != 0) break;
                    for (var j = point1.Y; j <= point2.Y; j++) {
                        if (this.FaceItems[i][j] != 0) break;
                        if (j == point2.Y) {
                            if (i < point2.X) {
                                for (var k = i; k < point2.X; k++) {
                                    if (this.FaceItems[k][j] != 0) break;
                                    if (k == point2.X - 1) {
                                        path.MidOne.X = i;
                                        path.MidOne.Y = point1.Y;
                                        path.MidTwo.X = i;
                                        path.MidTwo.Y = point2.Y;
                                        return true;
                                    }
                                }
                            }
                            else {
                                for (var k = i; k > point2.X; k--) {
                                    if (this.FaceItems[k][j] != 0) break;
                                    if (k == point2.X + 1) {
                                        path.MidOne.X = i;
                                        path.MidOne.Y = point1.Y;
                                        path.MidTwo.X = i;
                                        path.MidTwo.Y = point2.Y;
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
                for (i = point1.X - 1; i >= 0; i--) {
                    if (this.FaceItems[i][point1.Y] != 0) return false;
                    for (var j = point1.Y; j <= point2.Y; j++) {
                        if (this.FaceItems[i][j] != 0) break;
                        if (j == point2.Y) {
                            for (var k = i; k < point2.X; k++) {
                                if (this.FaceItems[k][j] != 0) break;
                                if (k == point2.X - 1) {
                                    path.MidOne.X = i;
                                    path.MidOne.Y = point1.Y;
                                    path.MidTwo.X = i;
                                    path.MidTwo.Y = point2.Y;
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
            else {
                for (i = point1.Y - 1; i >= point2.Y; i--) {
                    if (this.FaceItems[point1.X][i] != 0) break;
                    if (i == point2.Y) {
                        for (var j = point1.X; j < point2.X; j++) {
                            if (this.FaceItems[j][i] != 0) break;
                            if (j == point2.X - 1) {
                                path.MidOne.X = point1.X;
                                path.MidOne.Y = point2.Y;
                                path.MidTwo = path.GetMidOne();
                                return true;
                            }
                        }
                    }
                }
                for (i = point1.X + 1; i <= point2.X; i++) {
                    if (this.FaceItems[i][point1.Y] != 0) break;
                    if (i == point2.X) {
                        for (var j = point1.Y; j > point2.Y; j--) {
                            if (this.FaceItems[i][j] != 0) break;
                            if (j == point2.Y + 1) {
                                path.MidOne.X = point2.X;
                                path.MidOne.Y = point1.Y;
                                path.MidTwo = path.GetMidOne();
                                return true;
                            }
                        }
                    }
                }
                for (i = point1.Y - 1; i >= 0; i--) {
                    if (this.FaceItems[point1.X][i] != 0) break;
                    for (var j = point1.X; j <= point2.X; j++) {
                        if (this.FaceItems[j][i] != 0) break;
                        if (j == point2.X) {
                            if (i < point2.Y) {
                                for (var k = i; k < point2.Y; k++) {
                                    if (this.FaceItems[j][k] != 0) break;
                                    if (k == point2.Y - 1) {
                                        path.MidOne.X = point1.X;
                                        path.MidOne.Y = i;
                                        path.MidTwo.X = point2.X;
                                        path.MidTwo.Y = i;
                                        return true;
                                    }
                                }
                            }
                            else {
                                for (var k = i; k > point2.Y; k--) {
                                    if (this.FaceItems[j][k] != 0) break;
                                    if (k == point2.Y + 1) {
                                        path.MidOne.X = point1.X;
                                        path.MidOne.Y = i;
                                        path.MidTwo.X = point2.X;
                                        path.MidTwo.Y = i;
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
                for (i = point1.Y + 1; i < _boardsize.Y; i++) {
                    if (this.FaceItems[point1.X][i] != 0) break;
                    for (var j = point1.X; j <= point2.X; j++) {
                        if (this.FaceItems[j][i] != 0) break;
                        if (j == point2.X) {
                            for (var k = i; k > point2.Y; k--) {
                                if (this.FaceItems[j][k] != 0) break;
                                if (k == point2.Y + 1) {
                                    path.MidOne.X = point1.X;
                                    path.MidOne.Y = i;
                                    path.MidTwo.X = point2.X;
                                    path.MidTwo.Y = i;
                                    return true;
                                }
                            }
                        }
                    }
                }
                for (i = point1.X + 1; i < _boardsize.X; i++) {
                    if (this.FaceItems[i][point1.Y] != 0) break;
                    for (var j = point1.Y; j >= point2.Y; j--) {
                        if (this.FaceItems[i][j] != 0) break;
                        if (j == point2.Y) {
                            if (i < point2.X) {
                                for (var k = i; k < point2.X; k++) {
                                    if (this.FaceItems[k][j] != 0) break;
                                    if (k == point2.X - 1) {
                                        path.MidOne.X = i;
                                        path.MidOne.Y = point1.Y;
                                        path.MidTwo.X = i;
                                        path.MidTwo.Y = point2.Y;
                                        return true;
                                    }
                                }
                            }
                            else {
                                for (var k = i; k > point2.X; k--) {
                                    if (this.FaceItems[k][j] != 0) break;
                                    if (k == point2.X + 1) {
                                        path.MidOne.X = i;
                                        path.MidOne.Y = point1.Y;
                                        path.MidTwo.X = i;
                                        path.MidTwo.Y = point2.Y;
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
                for (i = point1.X - 1; i >= 0; i--) {
                    if (this.FaceItems[i][point1.Y] != 0) return false;
                    for (var j = point1.Y; j >= point2.Y; j--) {
                        if (this.FaceItems[i][j] != 0) break;
                        if (j == point2.Y) {
                            for (var k = i; k < point2.X; k++) {
                                if (this.FaceItems[k][j] != 0) break;
                                if (k == point2.X - 1) {
                                    path.MidOne.X = i;
                                    path.MidOne.Y = point1.Y;
                                    path.MidTwo.X = i;
                                    path.MidTwo.Y = point2.Y;
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
        }
        else {
            if (point1.Y == point2.Y) {
                if (point1.X == point2.X + 1) {
                    path.MidOne = path.GetStart();
                    path.MidTwo = path.GetStart();
                    return true;
                }
                for (i = point1.X - 1; i > point2.X; i--) {
                    if (this.FaceItems[i][point1.Y] != 0) break;
                    if (i == point2.X + 1) {
                        path.MidOne = path.GetStart();
                        path.MidTwo = path.GetStart();
                        return true;
                    }
                }
                for (i = point1.Y + 1; i < _boardsize.Y; i++) {
                    if (this.FaceItems[point1.X][i] != 0) break;
                    for (var j = point1.X - 1; j >= point2.X; j--) {
                        if (this.FaceItems[j][i] != 0) break;
                        if (j == point2.X) {
                            for (var k = i; k > point1.Y; k--) {
                                if (this.FaceItems[j][k] != 0) break;
                                if (k == point1.Y + 1) {
                                    path.MidOne.X = point1.X;
                                    path.MidOne.Y = i;
                                    path.MidTwo.X = point2.X;
                                    path.MidTwo.Y = i;
                                    return true;
                                }
                            }
                        }
                    }
                }
                for (i = point1.Y - 1; i >= 0; i--) {
                    if (this.FaceItems[point1.X][i] != 0) return false;
                    for (var j = point1.X - 1; j >= point2.X; j--) {
                        if (this.FaceItems[j][i] != 0) break;
                        if (j == point2.X) {
                            for (var k = i; k < point1.Y; k++) {
                                if (this.FaceItems[j][k] != 0) break;
                                if (k == point1.Y - 1) {
                                    path.MidOne.X = point1.X;
                                    path.MidOne.Y = i;
                                    path.MidTwo.X = point2.X;
                                    path.MidTwo.Y = i;
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
            else if (point1.Y < point2.Y) {
                for (i = point1.Y + 1; i <= point2.Y; i++) {
                    if (this.FaceItems[point1.X][i] != 0) break;
                    if (i == point2.Y) {
                        for (var j = point1.X; j > point2.X; j--) {
                            if (this.FaceItems[j][i] != 0) break;
                            if (j == point2.X + 1) {
                                path.MidOne.X = point1.X;
                                path.MidOne.Y = point2.Y;
                                path.MidTwo = path.GetMidOne();
                                return true;
                            }
                        }
                    }
                }
                for (i = point1.X - 1; i >= point2.X; i--) {
                    if (this.FaceItems[i][point1.Y] != 0) break;
                    if (i == point2.X) {
                        for (var j = point1.Y; j < point2.Y; j++) {
                            if (this.FaceItems[i][j] != 0) break;
                            if (j == point2.Y - 1) {
                                path.MidOne.X = point2.X;
                                path.MidOne.Y = point1.Y;
                                path.MidTwo = path.GetMidOne();
                                return true;
                            }
                        }
                    }
                }
                for (i = point1.Y + 1; i < _boardsize.Y; i++) {
                    if (this.FaceItems[point1.X][i] != 0) break;
                    for (var j = point1.X; j >= point2.X; j--) {
                        if (this.FaceItems[j][i] != 0) break;
                        if (j == point2.X) {
                            if (i < point2.Y) {
                                for (var k = i; k < point2.Y; k++) {
                                    if (this.FaceItems[j][k] != 0) break;
                                    if (k == point2.Y - 1) {
                                        path.MidOne.X = point1.X;
                                        path.MidOne.Y = i;
                                        path.MidTwo.X = point2.X;
                                        path.MidTwo.Y = i;
                                        return true;
                                    }
                                }
                            }
                            else {
                                for (var k = i; k > point2.Y; k--) {
                                    if (this.FaceItems[j][k] != 0) break;
                                    if (k == point2.Y + 1) {
                                        path.MidOne.X = point1.X;
                                        path.MidOne.Y = i;
                                        path.MidTwo.X = point2.X;
                                        path.MidTwo.Y = i;
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
                for (i = point1.Y - 1; i >= 0; i--) {
                    if (this.FaceItems[point1.X][i] != 0) break;
                    for (var j = point1.X; j >= point2.X; j--) {
                        if (this.FaceItems[j][i] != 0) break;
                        if (j == point2.X) {
                            for (var k = i; k < point2.Y; k++) {
                                if (this.FaceItems[j][k] != 0) break;
                                if (k == point2.Y - 1) {
                                    path.MidOne.X = point1.X;
                                    path.MidOne.Y = i;
                                    path.MidTwo.X = point2.X;
                                    path.MidTwo.Y = i;
                                    return true;
                                }
                            }
                        }
                    }
                }
                for (i = point1.X - 1; i >= 0; i--) {
                    if (this.FaceItems[i][point1.Y] != 0) break;
                    for (var j = point1.Y; j <= point2.Y; j++) {
                        if (this.FaceItems[i][j] != 0) break;
                        if (j == point2.Y) {
                            if (i < point2.X) {
                                for (var k = i; k < point2.X; k++) {
                                    if (this.FaceItems[k][j] != 0) break;
                                    if (k == point2.X - 1) {
                                        path.MidOne.X = i;
                                        path.MidOne.Y = point1.Y;
                                        path.MidTwo.X = i;
                                        path.MidTwo.Y = point2.Y;
                                        return true;
                                    }
                                }
                            }
                            else {
                                for (var k = i; k > point2.X; k--) {
                                    if (this.FaceItems[k][j] != 0) break;
                                    if (k == point2.X + 1) {
                                        path.MidOne.X = i;
                                        path.MidOne.Y = point1.Y;
                                        path.MidTwo.X = i;
                                        path.MidTwo.Y = point2.Y;
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
                for (i = point1.X + 1; i < _boardsize.X; i++) {
                    if (this.FaceItems[i][point1.Y] != 0) return false;
                    for (var j = point1.Y; j <= point2.Y; j++) {
                        if (this.FaceItems[i][j] != 0) break;
                        if (j == point2.Y) {
                            for (var k = i; k > point2.X; k--) {
                                if (this.FaceItems[k][j] != 0) break;
                                if (k == point2.X + 1) {
                                    path.MidOne.X = i;
                                    path.MidOne.Y = point1.Y;
                                    path.MidTwo.X = i;
                                    path.MidTwo.Y = point2.Y;
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
            else {
                for (i = point1.Y - 1; i >= point2.Y; i--) {
                    if (this.FaceItems[point1.X][i] != 0) break;
                    if (i == point2.Y) {
                        for (var j = point1.X; j > point2.X; j--) {
                            if (this.FaceItems[j][i] != 0) break;
                            if (j == point2.X + 1) {
                                path.MidOne.X = point1.X;
                                path.MidOne.Y = point2.Y;
                                path.MidTwo = path.GetMidOne();
                                return true;
                            }
                        }
                    }
                }
                for (i = point1.X - 1; i >= point2.X; i--) {
                    if (this.FaceItems[i][point1.Y] != 0) break;
                    if (i == point2.X) {
                        for (var j = point1.Y; j > point2.Y; j--) {
                            if (this.FaceItems[i][j] != 0) break;
                            if (j == point2.Y + 1) {
                                path.MidOne.X = point2.X;
                                path.MidOne.Y = point1.Y;
                                path.MidTwo = path.GetMidOne();
                                return true;
                            }
                        }
                    }
                }
                for (i = point1.Y - 1; i >= 0; i--) {
                    if (this.FaceItems[point1.X][i] != 0) break;
                    for (var j = point1.X; j >= point2.X; j--) {
                        if (this.FaceItems[j][i] != 0) break;
                        if (j == point2.X) {
                            if (i < point2.Y) {
                                for (var k = i; k < point2.Y; k++) {
                                    if (this.FaceItems[j][k] != 0) break;
                                    if (k == point2.Y - 1) {
                                        path.MidOne.X = point1.X;
                                        path.MidOne.Y = i;
                                        path.MidTwo.X = point2.X;
                                        path.MidTwo.Y = i;
                                        return true;
                                    }
                                }
                            }
                            else {
                                for (var k = i; k > point2.Y; k--) {
                                    if (this.FaceItems[j][k] != 0) break;
                                    if (k == point2.Y + 1) {
                                        path.MidOne.X = point1.X;
                                        path.MidOne.Y = i;
                                        path.MidTwo.X = point2.X;
                                        path.MidTwo.Y = i;
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
                for (i = point1.Y + 1; i < _boardsize.Y; i++) {
                    if (this.FaceItems[point1.X][i] != 0) break;
                    for (var j = point1.X; j >= point2.X; j--) {
                        if (this.FaceItems[j][i] != 0) break;
                        if (j == point2.X) {
                            for (var k = i; k > point2.Y; k--) {
                                if (this.FaceItems[j][k] != 0) break;
                                if (k == point2.Y + 1) {
                                    path.MidOne.X = point1.X;
                                    path.MidOne.Y = i;
                                    path.MidTwo.X = point2.X;
                                    path.MidTwo.Y = i;
                                    return true;
                                }
                            }
                        }
                    }
                }
                for (i = point1.X - 1; i >= 0; i--) {
                    if (this.FaceItems[i][point1.Y] != 0) break;
                    for (var j = point1.Y; j >= point2.Y; j--) {
                        if (this.FaceItems[i][j] != 0) break;
                        if (j == point2.Y) {
                            if (i < point2.X) {
                                for (var k = i; k < point2.X; k++) {
                                    if (this.FaceItems[k][j] != 0) break;
                                    if (k == point2.X - 1) {
                                        path.MidOne.X = i;
                                        path.MidOne.Y = point1.Y;
                                        path.MidTwo.X = i;
                                        path.MidTwo.Y = point2.Y;
                                        return true;
                                    }
                                }
                            }
                            else {
                                for (var k = i; k > point2.X; k--) {
                                    if (this.FaceItems[k][j] != 0) break;
                                    if (k == point2.X + 1) {
                                        path.MidOne.X = i;
                                        path.MidOne.Y = point1.Y;
                                        path.MidTwo.X = i;
                                        path.MidTwo.Y = point2.Y;
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
                for (i = point1.X + 1; i < _boardsize.X; i++) {
                    if (this.FaceItems[i][point1.Y] != 0) return false;
                    for (var j = point1.Y; j >= point2.Y; j--) {
                        if (this.FaceItems[i][j] != 0) break;
                        if (j == point2.Y) {
                            for (var k = i; k > point2.X; k--) {
                                if (this.FaceItems[k][j] != 0) break;
                                if (k == point2.X + 1) {
                                    path.MidOne.X = i;
                                    path.MidOne.Y = point1.Y;
                                    path.MidTwo.X = i;
                                    path.MidTwo.Y = point2.Y;
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
        }

        return false;
    }

    var rand = function () {
        return (Math.floor(Math.random() * 0x7fff) & 0x7fff);
    }

    // support Number and String
    var double2int = function (x) {
        //return x > 0 ? Math.floor(x) : Math.ceil(x);
        //return parseInt(x);
        //return ~~x;
        return (0 | x);
    }

    this.NewGame = function () {
        var i = 0;
        for (i = 0; i < _w + 2; i++) { this.FaceItems[i][0] = 0; this.FaceItems[i][_h + 1] = 0; }
        for (i = 0; i < _h + 2; i++) { this.FaceItems[0][i] = 0; this.FaceItems[_w + 1][i] = 0; }
        for (i = 0; i < _w * _h / 2; i++) {
            var face = rand() % _faceNum;
            this.FaceItems[(2 * i) % _w + 1][double2int((2 * i) / _w) + 1] = face + 1;
            this.FaceItems[((2 * i) + 1) % _w + 1][double2int(((2 * i) + 1) / _w) + 1] = face + 1;
        }

        var temp, x1, y1, x2, y2;
        for (i = 0; i < 20000; i++) {
            x1 = rand() % _w + 1;
            y1 = rand() % _h + 1;
            temp = this.FaceItems[x1][y1];
            x2 = rand() % _w + 1;
            y2 = rand() % _h + 1;
            this.FaceItems[x1][y1] = this.FaceItems[x2][y2];
            this.FaceItems[x2][y2] = temp;
        }

        var item = new Array(_w);
        for (i = 0; i < item.length; i++) {
            item[i] = new Array(_h);
            for (var j = 0; j < item[i].length; j++) {
                item[i][j] = 0;
            }
        }

        var path = new PATH();
        _sequence.Index = 0;
        while (!this.IsSuccessFinish()) {
            while (this.GetHint(path)) {
                item[path.Start.X - 1][path.Start.Y - 1] = this.FaceItems[path.Start.X][path.Start.Y];
                item[path.End.X - 1][path.End.Y - 1] = this.FaceItems[path.End.X][path.End.Y];
                _sequence.Steps[_sequence.Index].X = (path.Start.X - 1) + _w * (path.Start.Y - 1);
                _sequence.Steps[_sequence.Index++].Y = (path.End.X - 1) + _w * (path.End.Y - 1);
                this.ErasePair(path);
            }
            if (!this.IsSuccessFinish()) {
                this.RearrangeBoard();
            }
            else _sequence.Index = 0;
        }
        for (i = 0; i < _w * _h; i++) this.FaceItems[i % _w + 1][double2int(i / _w) + 1] = item[i % _w][double2int(i / _w)];
    }

    this.RearrangeBoard = function () {
        for (var i = 0; i < 10000; i++) {
            do {
                x1 = rand() % _w + 1;
                y1 = rand() % _h + 1;
            } while (this.FaceItems[x1][y1] == 0);
            temp = this.FaceItems[x1][y1];
            do {
                x2 = rand() % _w + 1;
                y2 = rand() % _h + 1;
            } while (this.FaceItems[x2][y2] == 0);
            this.FaceItems[x1][y1] = this.FaceItems[x2][y2];
            this.FaceItems[x2][y2] = temp;
        }
    }
    
    this.ErasePair = function (path) {
        this.FaceItems[path.Start.X][path.Start.Y] = 0;
        this.FaceItems[path.End.X][path.End.Y] = 0;
    }

    this.GetHint = function (path) {
        for (var i = 0; i < _w * _h - 1; i++) {
            for (var j = i + 1; j <= _w * _h; j++) {
                if (this.FaceItems[i % _w + 1][double2int(i / _w) + 1] != 0 && this.FaceItems[i % _w + 1][double2int((i / _w)) + 1] == this.FaceItems[j % _w + 1][double2int(j / _w) + 1]) {
                    path.Start.X = i % _w + 1;
                    path.Start.Y = double2int(i / _w) + 1;
                    path.End.X = j % _w + 1;
                    path.End.Y = double2int(j / _w) + 1;
                    if (this.IsFit(path)) return true;
                }
            }
        }

        return false;
    }

    this.IsSuccessFinish = function () {
        var sum = 0;

        for (var i = 0; i < _w * _h; i++) {
            if (this.FaceItems[i % _w + 1][double2int(i / _w) + 1] == 0) sum++;
        }
        if (sum == _w * _h) return true;

        return false;
    }

    this.IsSolvable = function () {
        var i = 0;
        var path = new PATH();

        var item = new Array(_w);
        for (i = 0; i < item.length; i++) {
            item[i] = new Array(_h);
            for (var j = 0; j < item[i].length; j++) {
                item[i][j] = 0;
            }
        }

        for (i = 0; i < _w * _h; i++) item[i % _w][double2int(i / _w)] = this.FaceItems[i % _w + 1][double2int(i / _w) + 1];
        while (this.GetHint(path)) {
            this.FaceItems[path.Start.X][path.Start.Y] = 0;
            this.FaceItems[path.End.X][path.End.Y] = 0;
        }
        if (this.IsSuccessFinish()) {
            for (i = 0; i < _w * _h; i++) this.FaceItems[i % _w + 1][double2int(i / _w) + 1] = item[i % _w][double2int(i / _w)];
            return true;
        }
        else {
            for (i = 0; i < _w * _h; i++) this.FaceItems[i % _w + 1][double2int(i / _w) + 1] = item[i % _w][double2int(i / _w)];
            return false;
        }
    }
}