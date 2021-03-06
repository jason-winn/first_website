package com.adobe.serialization.json
{

    public class JSONTokenizer extends Object
    {
        private var ch:String;
        private var loc:int;
        private var jsonString:String;
        private var strict:Boolean;
        private var controlCharsRegExp:RegExp;
        private var obj:Object;

        public function JSONTokenizer(param1:String, param2:Boolean)
        {
            controlCharsRegExp = /[\x00-\x1F]/;
            jsonString = param1;
            this.strict = param2;
            loc = 0;
            nextChar();
            return;
        }// end function

        private function skipComments() : void
        {
            if (ch == "/")
            {
                nextChar();
                switch(ch)
                {
                    case "/":
                    {
                        do
                        {
                            
                            nextChar();
                        }while (ch != "\n" && ch != "")
                        nextChar();
                        break;
                    }
                    case "*":
                    {
                        nextChar();
                        while (true)
                        {
                            
                            if (ch == "*")
                            {
                                nextChar();
                                if (ch == "/")
                                {
                                    nextChar();
                                    break;
                                }
                            }
                            else
                            {
                                nextChar();
                            }
                            if (ch == "")
                            {
                                parseError("Multi-line comment not closed");
                            }
                        }
                        break;
                    }
                    default:
                    {
                        parseError("Unexpected " + ch + " encountered (expecting \'/\' or \'*\' )");
                        break;
                    }
                }
            }
            return;
        }// end function

        private function isDigit(param1:String) : Boolean
        {
            return param1 >= "0" && param1 <= "9";
        }// end function

        private function readNumber() : JSONToken
        {
            var _loc_3:JSONToken = null;
            var _loc_1:String = "";
            if (ch == "-")
            {
                _loc_1 = _loc_1 + "-";
                nextChar();
            }
            if (!isDigit(ch))
            {
                parseError("Expecting a digit");
            }
            if (ch == "0")
            {
                _loc_1 = _loc_1 + ch;
                nextChar();
                if (isDigit(ch))
                {
                    parseError("A digit cannot immediately follow 0");
                }
                else if (!strict && ch == "x")
                {
                    _loc_1 = _loc_1 + ch;
                    nextChar();
                    if (isHexDigit(ch))
                    {
                        _loc_1 = _loc_1 + ch;
                        nextChar();
                    }
                    else
                    {
                        parseError("Number in hex format require at least one hex digit after \"0x\"");
                    }
                    while (isHexDigit(ch))
                    {
                        
                        _loc_1 = _loc_1 + ch;
                        nextChar();
                    }
                }
            }
            else
            {
                while (isDigit(ch))
                {
                    
                    _loc_1 = _loc_1 + ch;
                    nextChar();
                }
            }
            if (ch == ".")
            {
                _loc_1 = _loc_1 + ".";
                nextChar();
                if (!isDigit(ch))
                {
                    parseError("Expecting a digit");
                }
                while (isDigit(ch))
                {
                    
                    _loc_1 = _loc_1 + ch;
                    nextChar();
                }
            }
            if (ch == "e" || ch == "E")
            {
                _loc_1 = _loc_1 + "e";
                nextChar();
                if (ch == "+" || ch == "-")
                {
                    _loc_1 = _loc_1 + ch;
                    nextChar();
                }
                if (!isDigit(ch))
                {
                    parseError("Scientific notation number needs exponent value");
                }
                while (isDigit(ch))
                {
                    
                    _loc_1 = _loc_1 + ch;
                    nextChar();
                }
            }
            var _loc_2:* = Number(_loc_1);
            if (isFinite(_loc_2) && !isNaN(_loc_2))
            {
                _loc_3 = new JSONToken();
                _loc_3.type = JSONTokenType.NUMBER;
                _loc_3.value = _loc_2;
                return _loc_3;
            }
            parseError("Number " + _loc_2 + " is not valid!");
            return null;
        }// end function

        public function unescapeString(param1:String) : String
        {
            var _loc_6:* = undefined;
            var _loc_7:* = undefined;
            var _loc_8:* = undefined;
            var _loc_9:* = undefined;
            var _loc_10:* = undefined;
            if (strict && controlCharsRegExp.test(param1))
            {
                parseError("String contains unescaped control character (0x00-0x1F)");
            }
            var _loc_2:String = "";
            var _loc_3:int = 0;
            var _loc_4:int = 0;
            var _loc_5:* = param1.length;
            do
            {
                
                _loc_3 = param1.indexOf("\\", _loc_4);
                if (_loc_3 >= 0)
                {
                    _loc_2 = _loc_2 + param1.substr(_loc_4, _loc_3 - _loc_4);
                    _loc_4 = _loc_3 + 2;
                    _loc_6 = _loc_3 + 1;
                    _loc_7 = param1.charAt(_loc_6);
                    switch(_loc_7)
                    {
                        case "\"":
                        {
                            _loc_2 = _loc_2 + "\"";
                            break;
                        }
                        case "\\":
                        {
                            _loc_2 = _loc_2 + "\\";
                            break;
                        }
                        case "n":
                        {
                            _loc_2 = _loc_2 + "\n";
                            break;
                        }
                        case "r":
                        {
                            _loc_2 = _loc_2 + "\r";
                            break;
                        }
                        case "t":
                        {
                            _loc_2 = _loc_2 + "\t";
                            break;
                        }
                        case "u":
                        {
                            _loc_8 = "";
                            if (_loc_4 + 4 > _loc_5)
                            {
                                parseError("Unexpected end of input.  Expecting 4 hex digits after \\u.");
                            }
                            _loc_9 = _loc_4;
                            while (_loc_9 < _loc_4 + 4)
                            {
                                
                                _loc_10 = param1.charAt(_loc_9);
                                if (!isHexDigit(_loc_10))
                                {
                                    parseError("Excepted a hex digit, but found: " + _loc_10);
                                }
                                _loc_8 = _loc_8 + _loc_10;
                                _loc_9 = _loc_9 + 1;
                            }
                            _loc_2 = _loc_2 + String.fromCharCode(parseInt(_loc_8, 16));
                            _loc_4 = _loc_4 + 4;
                            break;
                        }
                        case "f":
                        {
                            _loc_2 = _loc_2 + "\f";
                            break;
                        }
                        case "/":
                        {
                            _loc_2 = _loc_2 + "/";
                            break;
                        }
                        case "b":
                        {
                            _loc_2 = _loc_2 + "\b";
                            break;
                        }
                        default:
                        {
                            _loc_2 = _loc_2 + ("\\" + _loc_7);
                            break;
                        }
                    }
                    continue;
                }
                _loc_2 = _loc_2 + param1.substr(_loc_4);
                break;
            }while (_loc_4 < _loc_5)
            return _loc_2;
        }// end function

        private function skipWhite() : void
        {
            while (isWhiteSpace(ch))
            {
                
                nextChar();
            }
            return;
        }// end function

        private function isWhiteSpace(param1:String) : Boolean
        {
            if (param1 == " " || param1 == "\t" || param1 == "\n" || param1 == "\r")
            {
                return true;
            }
            if (!strict && param1.charCodeAt(0) == 160)
            {
                return true;
            }
            return false;
        }// end function

        public function parseError(param1:String) : void
        {
            throw new JSONParseError(param1, loc, jsonString);
        }// end function

        private function readString() : JSONToken
        {
            var _loc_3:* = undefined;
            var _loc_4:* = undefined;
            var _loc_1:* = loc;
            do
            {
                
                _loc_1 = jsonString.indexOf("\"", _loc_1);
                if (_loc_1 >= 0)
                {
                    _loc_3 = 0;
                    _loc_4 = _loc_1 - 1;
                    while (jsonString.charAt(_loc_4) == "\\")
                    {
                        
                        _loc_3 = _loc_3 + 1;
                        _loc_4 = _loc_4 - 1;
                    }
                    if (_loc_3 % 2 == 0)
                    {
                        break;
                    }
                    _loc_1++;
                    continue;
                }
                parseError("Unterminated string literal");
            }while (true)
            var _loc_2:* = new JSONToken();
            _loc_2.type = JSONTokenType.STRING;
            _loc_2.value = unescapeString(jsonString.substr(loc, _loc_1 - loc));
            loc = _loc_1 + 1;
            nextChar();
            return _loc_2;
        }// end function

        private function nextChar() : String
        {
            var _loc_1:* = jsonString.charAt(loc++);
            ch = jsonString.charAt(loc++);
            return _loc_1;
        }// end function

        private function skipIgnored() : void
        {
            var _loc_1:int = 0;
            do
            {
                
                _loc_1 = loc;
                skipWhite();
                skipComments();
            }while (_loc_1 != loc)
            return;
        }// end function

        private function isHexDigit(param1:String) : Boolean
        {
            return isDigit(param1) || param1 >= "A" && param1 <= "F" || param1 >= "a" && param1 <= "f";
        }// end function

        public function getNextToken() : JSONToken
        {
            var _loc_2:String = null;
            var _loc_3:String = null;
            var _loc_4:String = null;
            var _loc_5:String = null;
            var _loc_1:* = new JSONToken();
            skipIgnored();
            switch(ch)
            {
                case "{":
                {
                    _loc_1.type = JSONTokenType.LEFT_BRACE;
                    _loc_1.value = "{";
                    nextChar();
                    break;
                }
                case "}":
                {
                    _loc_1.type = JSONTokenType.RIGHT_BRACE;
                    _loc_1.value = "}";
                    nextChar();
                    break;
                }
                case "[":
                {
                    _loc_1.type = JSONTokenType.LEFT_BRACKET;
                    _loc_1.value = "[";
                    nextChar();
                    break;
                }
                case "]":
                {
                    _loc_1.type = JSONTokenType.RIGHT_BRACKET;
                    _loc_1.value = "]";
                    nextChar();
                    break;
                }
                case ",":
                {
                    _loc_1.type = JSONTokenType.COMMA;
                    _loc_1.value = ",";
                    nextChar();
                    break;
                }
                case ":":
                {
                    _loc_1.type = JSONTokenType.COLON;
                    _loc_1.value = ":";
                    nextChar();
                    break;
                }
                case "t":
                {
                    _loc_2 = "t" + nextChar() + nextChar() + nextChar();
                    if (_loc_2 == "true")
                    {
                        _loc_1.type = JSONTokenType.TRUE;
                        _loc_1.value = true;
                        nextChar();
                    }
                    else
                    {
                        parseError("Expecting \'true\' but found " + _loc_2);
                    }
                    break;
                }
                case "f":
                {
                    _loc_3 = "f" + nextChar() + nextChar() + nextChar() + nextChar();
                    if (_loc_3 == "false")
                    {
                        _loc_1.type = JSONTokenType.FALSE;
                        _loc_1.value = false;
                        nextChar();
                    }
                    else
                    {
                        parseError("Expecting \'false\' but found " + _loc_3);
                    }
                    break;
                }
                case "n":
                {
                    _loc_4 = "n" + nextChar() + nextChar() + nextChar();
                    if (_loc_4 == "null")
                    {
                        _loc_1.type = JSONTokenType.NULL;
                        _loc_1.value = null;
                        nextChar();
                    }
                    else
                    {
                        parseError("Expecting \'null\' but found " + _loc_4);
                    }
                    break;
                }
                case "N":
                {
                    _loc_5 = "N" + nextChar() + nextChar();
                    if (_loc_5 == "NaN")
                    {
                        _loc_1.type = JSONTokenType.NAN;
                        _loc_1.value = NaN;
                        nextChar();
                    }
                    else
                    {
                        parseError("Expecting \'NaN\' but found " + _loc_5);
                    }
                    break;
                }
                case "\"":
                {
                    _loc_1 = readString();
                    break;
                }
                default:
                {
                    if (isDigit(ch) || ch == "-")
                    {
                        _loc_1 = readNumber();
                    }
                    else
                    {
                        if (ch == "")
                        {
                            return null;
                        }
                        parseError("Unexpected " + ch + " encountered");
                    }
                    break;
                }
            }
            return _loc_1;
        }// end function

    }
}
