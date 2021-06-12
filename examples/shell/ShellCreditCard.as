package 
{
    import assets.common.*;
    import com.adobe.serialization.json.*;
    import com.google.analytics.*;
    import com.indusblue.utils.*;
    import com.shell.data.*;
    import com.shell.display.preloader.*;
    import com.shell.utils.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import gs.*;

    public class ShellCreditCard extends Sprite
    {
        private var _mainSWF:MovieClip;
        private var _background:MovieClip;
        private var _preloader:Preloader;

        public function ShellCreditCard()
        {
            var url:String;
            var request:URLRequest;
            var loader:URLLoader;
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            Language.lang = root.loaderInfo.parameters.lang || "en";
            try
            {
                ShellTracker.tracker = new GATracker(this, "window.pageTracker", "Bridge", false);
            }
            catch (e:Error)
            {
                trace(e.message);
            }
            var _loc_2:* = new SiteBackgroundAsset();
            _background = new SiteBackgroundAsset();
            addChild(_loc_2);
            _background.stop();
            Language.languify(_background.logo);
            _background.logo.alpha = 0;
            var _loc_2:* = new Preloader();
            _preloader = new Preloader();
            addChild(_loc_2);
            _preloader.x = 738 / 2 - _preloader.width / 2;
            _preloader.y = 580 / 2 - 50;
            _preloader.alpha = 0;
            hash = root.loaderInfo.parameters.hash;
            if (hash)
            {
                url = Constants.REFERER_INFO_URL + hash + "/";
                request = new URLRequest(url);
                loader = new URLLoader();
                loader.addEventListener(Event.COMPLETE, onHashSendComplete);
                loader.addEventListener(IOErrorEvent.IO_ERROR, onHashSendError);
                loader.load(request);
            }
            else
            {
                initLoader();
            }
            return;
        }// end function

        private function onSWFLoadComplete(event:Event) : void
        {
            var _loc_2:* = LoaderInfo(event.target);
            _loc_2.loader.removeEventListener(ProgressEvent.PROGRESS, onSWFLoadProgress);
            _loc_2.loader.removeEventListener(Event.COMPLETE, onSWFLoadComplete);
            _mainSWF = MovieClip(_loc_2.content);
            if (Master.isDebug)
            {
                TweenLite.to(_preloader, 1, {percentage:100, ease:"linear", onComplete:cleanupPreloader});
            }
            else
            {
                cleanupPreloader();
            }
            return;
        }// end function

        private function initLoader() : void
        {
            var _loc_1:* = new Loader();
            if (!Master.isDebug)
            {
                _loc_1.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onSWFLoadProgress);
            }
            _loc_1.contentLoaderInfo.addEventListener(Event.COMPLETE, onSWFLoadComplete);
            _loc_1.name = "loader";
            addChild(_loc_1);
            TweenMax.to(_preloader, 0.3, {alpha:1, onComplete:_loc_1.load, onCompleteParams:[new URLRequest("Main.swf")]});
            return;
        }// end function

        private function onInitMain() : void
        {
            removeChild(_preloader);
            _preloader = null;
            _mainSWF.init();
            return;
        }// end function

        private function onHashSendError(event:IOErrorEvent) : void
        {
            initLoader();
            trace(event.text);
            return;
        }// end function

        private function cleanupPreloader() : void
        {
            var _loc_1:Number = 20;
            var _loc_2:* = _preloader.x - _loc_1 * _preloader.width / 2;
            var _loc_3:* = _preloader.y - _loc_1 * 50 - 200;
            _preloader.cacheAsBitmap = true;
            TweenLite.to(_preloader, 0.3, {alpha:0, onComplete:onInitMain, delay:0.5});
            _background.play();
            TweenMax.to(_background.logo, 0.5, {alpha:1});
            return;
        }// end function

        private function onHashSendComplete(event:Event) : void
        {
            var _loc_2:* = JSON.decode(event.target.data);
            if (_loc_2.status == "ok")
            {
                RefererData.getInstance().message = _loc_2.message;
                RefererData.getInstance().name = _loc_2.name;
                RefererData.getInstance().destinationName = _loc_2.city;
                RefererData.getInstance().licensePlate = _loc_2.plate;
                RefererData.getInstance().carType = parseInt(_loc_2.car);
            }
            initLoader();
            return;
        }// end function

        private function onSWFLoadProgress(event:ProgressEvent) : void
        {
            _preloader.percentage = event.bytesLoaded / event.bytesTotal * 100;
            return;
        }// end function

    }
}
