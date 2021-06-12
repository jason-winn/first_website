package com.google.analytics.core
{
    import com.google.analytics.data.*;
    import com.google.analytics.debug.*;
    import com.google.analytics.v4.*;
    import flash.events.*;
    import flash.net.*;

    dynamic public class Buffer extends Object
    {
        private var _SO:SharedObject;
        private var _data:Object;
        private var _OBJ:Object;
        private var _utmb:UTMB;
        private var _utmc:UTMC;
        private var _utma:UTMA;
        private var _debug:DebugConfiguration;
        private var _utmk:UTMK;
        private var _config:Configuration;
        private var _utmv:UTMV;
        private var _utmx:UTMX;
        private var _utmz:UTMZ;
        private var _volatile:Boolean;

        public function Buffer(param1:Configuration, param2:DebugConfiguration, param3:Boolean = false, param4:Object = null)
        {
            var _loc_5:String = null;
            _config = param1;
            _debug = param2;
            _data = param4;
            _volatile = param3;
            if (_volatile)
            {
                _OBJ = new Object();
                if (_data)
                {
                    for (_loc_5 in _data)
                    {
                        
                        _OBJ[_loc_5] = _data[_loc_5];
                    }
                }
            }
            return;
        }// end function

        public function save() : void
        {
            var flushStatus:String;
            if (!isVolatile())
            {
                flushStatus;
                try
                {
                    flushStatus = _SO.flush();
                }
                catch (e:Error)
                {
                    _debug.warning("Error...Could not write SharedObject to disk");
                }
                switch(flushStatus)
                {
                    case SharedObjectFlushStatus.PENDING:
                    {
                        _debug.info("Requesting permission to save object...");
                        _SO.addEventListener(NetStatusEvent.NET_STATUS, _onFlushStatus);
                        break;
                    }
                    case SharedObjectFlushStatus.FLUSHED:
                    {
                        _debug.info("Value flushed to disk.");
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            return;
        }// end function

        public function get utmv() : UTMV
        {
            if (!hasUTMV())
            {
                _createUMTV();
            }
            return _utmv;
        }// end function

        public function get utmx() : UTMX
        {
            if (!hasUTMX())
            {
                _createUMTX();
            }
            return _utmx;
        }// end function

        public function get utmz() : UTMZ
        {
            if (!hasUTMZ())
            {
                _createUMTZ();
            }
            return _utmz;
        }// end function

        public function hasUTMA() : Boolean
        {
            if (_utma)
            {
                return true;
            }
            return false;
        }// end function

        public function hasUTMB() : Boolean
        {
            if (_utmb)
            {
                return true;
            }
            return false;
        }// end function

        public function hasUTMC() : Boolean
        {
            if (_utmc)
            {
                return true;
            }
            return false;
        }// end function

        public function clearCookies() : void
        {
            utma.reset();
            utmb.reset();
            utmc.reset();
            utmz.reset();
            utmv.reset();
            utmk.reset();
            return;
        }// end function

        public function resetCurrentSession() : void
        {
            _clearUTMB();
            _clearUTMC();
            save();
            return;
        }// end function

        public function hasUTMK() : Boolean
        {
            if (_utmk)
            {
                return true;
            }
            return false;
        }// end function

        public function getLinkerUrl(param1:String = "", param2:Boolean = false) : String
        {
            var _loc_3:* = toLinkerParams();
            var _loc_4:* = param1;
            var _loc_5:* = param1.split("#");
            if (_loc_3)
            {
                if (param2)
                {
                    if (_loc_5.length <= 1)
                    {
                        _loc_4 = _loc_4 + ("#" + _loc_3);
                    }
                    else
                    {
                        _loc_4 = _loc_4 + ("&" + _loc_3);
                    }
                }
                else if (_loc_5.length <= 1)
                {
                    if (param1.indexOf("?") > -1)
                    {
                        _loc_4 = _loc_4 + "&";
                    }
                    else
                    {
                        _loc_4 = _loc_4 + "?";
                    }
                    _loc_4 = _loc_4 + _loc_3;
                }
                else
                {
                    _loc_4 = _loc_5[0];
                    if (param1.indexOf("?") > -1)
                    {
                        _loc_4 = _loc_4 + "&";
                    }
                    else
                    {
                        _loc_4 = _loc_4 + "?";
                    }
                    _loc_4 = _loc_4 + (_loc_3 + "#" + _loc_5[1]);
                }
            }
            return _loc_4;
        }// end function

        public function generateCookiesHash() : Number
        {
            var _loc_1:String = "";
            _loc_1 = _loc_1 + utma.valueOf();
            _loc_1 = _loc_1 + utmb.valueOf();
            _loc_1 = _loc_1 + utmc.valueOf();
            _loc_1 = _loc_1 + utmx.valueOf();
            _loc_1 = _loc_1 + utmz.valueOf();
            _loc_1 = _loc_1 + utmv.valueOf();
            return Utils.generateHash(_loc_1);
        }// end function

        private function _createUMTA() : void
        {
            _utma = new UTMA();
            _utma.proxy = this;
            return;
        }// end function

        private function _createUMTB() : void
        {
            _utmb = new UTMB();
            _utmb.proxy = this;
            return;
        }// end function

        private function _createUMTC() : void
        {
            _utmc = new UTMC();
            return;
        }// end function

        public function hasUTMV() : Boolean
        {
            if (_utmv)
            {
                return true;
            }
            return false;
        }// end function

        private function _createUMTK() : void
        {
            _utmk = new UTMK();
            _utmk.proxy = this;
            return;
        }// end function

        public function hasUTMX() : Boolean
        {
            if (_utmx)
            {
                return true;
            }
            return false;
        }// end function

        public function hasUTMZ() : Boolean
        {
            if (_utmz)
            {
                return true;
            }
            return false;
        }// end function

        private function _createUMTV() : void
        {
            _utmv = new UTMV();
            _utmv.proxy = this;
            return;
        }// end function

        private function _createUMTX() : void
        {
            _utmx = new UTMX();
            _utmx.proxy = this;
            return;
        }// end function

        private function _createUMTZ() : void
        {
            _utmz = new UTMZ();
            _utmz.proxy = this;
            return;
        }// end function

        public function updateUTMA(param1:Number) : void
        {
            if (_debug.verbose)
            {
                _debug.info("updateUTMA( " + param1 + " )", VisualDebugMode.advanced);
            }
            if (!utma.isEmpty())
            {
                if (isNaN(utma.sessionCount))
                {
                    utma.sessionCount = 1;
                }
                else
                {
                    (utma.sessionCount + 1);
                }
                utma.lastTime = utma.currentTime;
                utma.currentTime = param1;
            }
            return;
        }// end function

        public function isGenuine() : Boolean
        {
            if (!hasUTMK())
            {
                return true;
            }
            return utmk.hash == generateCookiesHash();
        }// end function

        private function _onFlushStatus(event:NetStatusEvent) : void
        {
            _debug.info("User closed permission dialog...");
            switch(event.info.code)
            {
                case "SharedObject.Flush.Success":
                {
                    _debug.info("User granted permission -- value saved.");
                    break;
                }
                case "SharedObject.Flush.Failed":
                {
                    _debug.info("User denied permission -- value not saved.");
                    break;
                }
                default:
                {
                    break;
                }
            }
            _SO.removeEventListener(NetStatusEvent.NET_STATUS, _onFlushStatus);
            return;
        }// end function

        public function toLinkerParams() : String
        {
            var _loc_1:String = "";
            _loc_1 = _loc_1 + utma.toURLString();
            _loc_1 = _loc_1 + ("&" + utmb.toURLString());
            _loc_1 = _loc_1 + ("&" + utmc.toURLString());
            _loc_1 = _loc_1 + ("&" + utmx.toURLString());
            _loc_1 = _loc_1 + ("&" + utmz.toURLString());
            _loc_1 = _loc_1 + ("&" + utmv.toURLString());
            _loc_1 = _loc_1 + ("&__utmk=" + generateCookiesHash());
            return _loc_1;
        }// end function

        private function _clearUTMA() : void
        {
            _utma = null;
            if (!isVolatile())
            {
                _SO.data.utma = null;
                delete _SO.data.utma;
            }
            return;
        }// end function

        private function _clearUTMC() : void
        {
            _utmc = null;
            return;
        }// end function

        private function _clearUTMB() : void
        {
            _utmb = null;
            if (!isVolatile())
            {
                _SO.data.utmb = null;
                delete _SO.data.utmb;
            }
            return;
        }// end function

        public function update(param1:String, param2) : void
        {
            if (isVolatile())
            {
                _OBJ[param1] = param2;
            }
            else
            {
                _SO.data[param1] = param2;
            }
            return;
        }// end function

        public function createSO() : void
        {
            var saveSO:Boolean;
            UTMZ.defaultTimespan = _config.conversionTimeout;
            UTMB.defaultTimespan = _config.sessionTimeout;
            if (!_volatile)
            {
                try
                {
                    _SO = SharedObject.getLocal(_config.cookieName, _config.cookiePath);
                }
                catch (e:Error)
                {
                    if (_debug.active)
                    {
                        _debug.warning("Shared Object " + _config.cookieName + " failed to be set\nreason: " + e.message);
                    }
                }
                saveSO;
                if (_SO.data.utma)
                {
                    if (!hasUTMA())
                    {
                        _createUMTA();
                    }
                    _utma.fromSharedObject(_SO.data.utma);
                    if (_debug.verbose)
                    {
                        _debug.info("found: " + _utma.toString(true), VisualDebugMode.geek);
                    }
                    if (_utma.isExpired())
                    {
                        if (_debug.verbose)
                        {
                            _debug.warning("UTMA has expired", VisualDebugMode.advanced);
                        }
                        _clearUTMA();
                        saveSO;
                    }
                }
                if (_SO.data.utmb)
                {
                    if (!hasUTMB())
                    {
                        _createUMTB();
                    }
                    _utmb.fromSharedObject(_SO.data.utmb);
                    if (_debug.verbose)
                    {
                        _debug.info("found: " + _utmb.toString(true), VisualDebugMode.geek);
                    }
                    if (_utmb.isExpired())
                    {
                        if (_debug.verbose)
                        {
                            _debug.warning("UTMB has expired", VisualDebugMode.advanced);
                        }
                        _clearUTMB();
                        saveSO;
                    }
                }
                if (_SO.data.utmc)
                {
                    delete _SO.data.utmc;
                    saveSO;
                }
                if (_SO.data.utmk)
                {
                    if (!hasUTMK())
                    {
                        _createUMTK();
                    }
                    _utmk.fromSharedObject(_SO.data.utmk);
                    if (_debug.verbose)
                    {
                        _debug.info("found: " + _utmk.toString(), VisualDebugMode.geek);
                    }
                }
                if (!hasUTMX())
                {
                    _createUMTX();
                }
                if (_SO.data.utmv)
                {
                    if (!hasUTMV())
                    {
                        _createUMTV();
                    }
                    _utmv.fromSharedObject(_SO.data.utmv);
                    if (_debug.verbose)
                    {
                        _debug.info("found: " + _utmv.toString(true), VisualDebugMode.geek);
                    }
                    if (_utmv.isExpired())
                    {
                        if (_debug.verbose)
                        {
                            _debug.warning("UTMV has expired", VisualDebugMode.advanced);
                        }
                        _clearUTMV();
                        saveSO;
                    }
                }
                if (_SO.data.utmz)
                {
                    if (!hasUTMZ())
                    {
                        _createUMTZ();
                    }
                    _utmz.fromSharedObject(_SO.data.utmz);
                    if (_debug.verbose)
                    {
                        _debug.info("found: " + _utmz.toString(true), VisualDebugMode.geek);
                    }
                    if (_utmz.isExpired())
                    {
                        if (_debug.verbose)
                        {
                            _debug.warning("UTMZ has expired", VisualDebugMode.advanced);
                        }
                        _clearUTMZ();
                        saveSO;
                    }
                }
                if (saveSO)
                {
                    save();
                }
            }
            return;
        }// end function

        private function _clearUTMZ() : void
        {
            _utmz = null;
            if (!isVolatile())
            {
                _SO.data.utmz = null;
                delete _SO.data.utmz;
            }
            return;
        }// end function

        private function _clearUTMV() : void
        {
            _utmv = null;
            if (!isVolatile())
            {
                _SO.data.utmv = null;
                delete _SO.data.utmv;
            }
            return;
        }// end function

        public function isVolatile() : Boolean
        {
            return _volatile;
        }// end function

        public function get utma() : UTMA
        {
            if (!hasUTMA())
            {
                _createUMTA();
            }
            return _utma;
        }// end function

        public function get utmb() : UTMB
        {
            if (!hasUTMB())
            {
                _createUMTB();
            }
            return _utmb;
        }// end function

        public function get utmc() : UTMC
        {
            if (!hasUTMC())
            {
                _createUMTC();
            }
            return _utmc;
        }// end function

        public function get utmk() : UTMK
        {
            if (!hasUTMK())
            {
                _createUMTK();
            }
            return _utmk;
        }// end function

    }
}
