package com.adobe.serialization.json
{

    public class JSONDecoder extends Object
    {
        private var strict:Boolean;
        private var value:Object;
        private var tokenizer:JSONTokenizer;
        private var token:JSONToken;

        public function JSONDecoder(param1:String, param2:Boolean)
        {
            this.strict = param2;
            tokenizer = new JSONTokenizer(param1, param2);
            nextToken();
            value = parseValue();
            if (param2 && nextToken() != null)
            {
                tokenizer.parseError("Unexpected characters left in input stream");
            }
            return;
        }// end function

        private function nextToken() : JSONToken
        {
            var _loc_1:* = tokenizer.getNextToken();
            token = tokenizer.getNextToken();
            return _loc_1;
        }// end function

        private function parseObject() : Object
        {
            var _loc_2:String = null;
            var _loc_1:* = new Object();
            nextToken();
            if (token.type == JSONTokenType.RIGHT_BRACE)
            {
                return _loc_1;
            }
            if (!strict && token.type == JSONTokenType.COMMA)
            {
                nextToken();
                if (token.type == JSONTokenType.RIGHT_BRACE)
                {
                    return _loc_1;
                }
                tokenizer.parseError("Leading commas are not supported.  Expecting \'}\' but found " + token.value);
            }
            while (true)
            {
                
                if (token.type == JSONTokenType.STRING)
                {
                    _loc_2 = String(token.value);
                    nextToken();
                    if (token.type == JSONTokenType.COLON)
                    {
                        nextToken();
                        _loc_1[_loc_2] = parseValue();
                        nextToken();
                        if (token.type == JSONTokenType.RIGHT_BRACE)
                        {
                            return _loc_1;
                        }
                        if (token.type == JSONTokenType.COMMA)
                        {
                            nextToken();
                            if (!strict)
                            {
                                if (token.type == JSONTokenType.RIGHT_BRACE)
                                {
                                    return _loc_1;
                                }
                            }
                        }
                        else
                        {
                            tokenizer.parseError("Expecting } or , but found " + token.value);
                        }
                    }
                    else
                    {
                        tokenizer.parseError("Expecting : but found " + token.value);
                    }
                    continue;
                }
                tokenizer.parseError("Expecting string but found " + token.value);
            }
            return null;
        }// end function

        private function parseArray() : Array
        {
            var _loc_1:* = new Array();
            nextToken();
            if (token.type == JSONTokenType.RIGHT_BRACKET)
            {
                return _loc_1;
            }
            if (!strict && token.type == JSONTokenType.COMMA)
            {
                nextToken();
                if (token.type == JSONTokenType.RIGHT_BRACKET)
                {
                    return _loc_1;
                }
                tokenizer.parseError("Leading commas are not supported.  Expecting \']\' but found " + token.value);
            }
            while (true)
            {
                
                _loc_1.push(parseValue());
                nextToken();
                if (token.type == JSONTokenType.RIGHT_BRACKET)
                {
                    return _loc_1;
                }
                if (token.type == JSONTokenType.COMMA)
                {
                    nextToken();
                    if (!strict)
                    {
                        if (token.type == JSONTokenType.RIGHT_BRACKET)
                        {
                            return _loc_1;
                        }
                    }
                    continue;
                }
                tokenizer.parseError("Expecting ] or , but found " + token.value);
            }
            return null;
        }// end function

        public function getValue()
        {
            return value;
        }// end function

        private function parseValue() : Object
        {
            if (token == null)
            {
                tokenizer.parseError("Unexpected end of input");
            }
            switch(token.type)
            {
                case JSONTokenType.LEFT_BRACE:
                {
                    return parseObject();
                }
                case JSONTokenType.LEFT_BRACKET:
                {
                    return parseArray();
                }
                case JSONTokenType.STRING:
                case JSONTokenType.NUMBER:
                case JSONTokenType.TRUE:
                case JSONTokenType.FALSE:
                case JSONTokenType.NULL:
                {
                    return token.value;
                }
                case JSONTokenType.NAN:
                {
                    if (!strict)
                    {
                        return token.value;
                    }
                    tokenizer.parseError("Unexpected " + token.value);
                }
                default:
                {
                    tokenizer.parseError("Unexpected " + token.value);
                    break;
                }
            }
            return null;
        }// end function

    }
}
