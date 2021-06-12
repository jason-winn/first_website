package fl.controls
{
    import fl.core.*;
    import fl.events.*;
    import flash.events.*;
    import flash.text.*;

    public class UIScrollBar extends ScrollBar
    {
        protected var inScroll:Boolean = false;
        protected var _scrollTarget:TextField;
        protected var inEdit:Boolean = false;
        private static var defaultStyles:Object = {};

        public function UIScrollBar()
        {
            inEdit = false;
            inScroll = false;
            return;
        }// end function

        protected function handleTargetScroll(event:Event) : void
        {
            if (inDrag)
            {
                return;
            }
            if (!enabled)
            {
                return;
            }
            inEdit = true;
            updateScrollTargetProperties();
            scrollPosition = direction == ScrollBarDirection.HORIZONTAL ? (_scrollTarget.scrollH) : (_scrollTarget.scrollV);
            inEdit = false;
            return;
        }// end function

        override public function set minScrollPosition(param1:Number) : void
        {
            super.minScrollPosition = param1 < 0 ? (0) : (param1);
            return;
        }// end function

        override public function setScrollPosition(param1:Number, param2:Boolean = true) : void
        {
            super.setScrollPosition(param1, param2);
            if (!_scrollTarget)
            {
                inScroll = false;
                return;
            }
            updateTargetScroll();
            return;
        }// end function

        override public function setScrollProperties(param1:Number, param2:Number, param3:Number, param4:Number = 0) : void
        {
            var _loc_5:Number = NaN;
            var _loc_6:Number = NaN;
            _loc_5 = param3;
            _loc_6 = param2 < 0 ? (0) : (param2);
            if (_scrollTarget != null)
            {
                if (direction == ScrollBarDirection.HORIZONTAL)
                {
                    _loc_5 = param3 > _scrollTarget.maxScrollH ? (_scrollTarget.maxScrollH) : (_loc_5);
                }
                else
                {
                    _loc_5 = param3 > _scrollTarget.maxScrollV ? (_scrollTarget.maxScrollV) : (_loc_5);
                }
            }
            super.setScrollProperties(param1, _loc_6, _loc_5, param4);
            return;
        }// end function

        public function get scrollTargetName() : String
        {
            return _scrollTarget.name;
        }// end function

        public function get scrollTarget() : TextField
        {
            return _scrollTarget;
        }// end function

        protected function updateScrollTargetProperties() : void
        {
            var _loc_1:Boolean = false;
            var _loc_2:Number = NaN;
            if (_scrollTarget == null)
            {
                setScrollProperties(pageSize, minScrollPosition, maxScrollPosition, pageScrollSize);
                scrollPosition = 0;
            }
            else
            {
                _loc_1 = direction == ScrollBarDirection.HORIZONTAL;
                _loc_2 = _loc_1 ? (_scrollTarget.width) : (10);
                setScrollProperties(_loc_2, _loc_1 ? (0) : (1), _loc_1 ? (_scrollTarget.maxScrollH) : (_scrollTarget.maxScrollV), pageScrollSize);
                scrollPosition = _loc_1 ? (_scrollTarget.scrollH) : (_scrollTarget.scrollV);
            }
            return;
        }// end function

        public function update() : void
        {
            inEdit = true;
            updateScrollTargetProperties();
            inEdit = false;
            return;
        }// end function

        public function set scrollTargetName(param1:String) : void
        {
            var target:* = param1;
            try
            {
                scrollTarget = parent.getChildByName(target) as TextField;
            }
            catch (error:Error)
            {
                throw new Error("ScrollTarget not found, or is not a TextField");
            }
            return;
        }// end function

        override public function set direction(param1:String) : void
        {
            if (isLivePreview)
            {
                return;
            }
            super.direction = param1;
            updateScrollTargetProperties();
            return;
        }// end function

        protected function handleTargetChange(event:Event) : void
        {
            inEdit = true;
            setScrollPosition(direction == ScrollBarDirection.HORIZONTAL ? (_scrollTarget.scrollH) : (_scrollTarget.scrollV), true);
            updateScrollTargetProperties();
            inEdit = false;
            return;
        }// end function

        override public function set maxScrollPosition(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            _loc_2 = param1;
            if (_scrollTarget != null)
            {
                if (direction == ScrollBarDirection.HORIZONTAL)
                {
                    _loc_2 = _loc_2 > _scrollTarget.maxScrollH ? (_scrollTarget.maxScrollH) : (_loc_2);
                }
                else
                {
                    _loc_2 = _loc_2 > _scrollTarget.maxScrollV ? (_scrollTarget.maxScrollV) : (_loc_2);
                }
            }
            super.maxScrollPosition = _loc_2;
            return;
        }// end function

        protected function updateTargetScroll(event:ScrollEvent = null) : void
        {
            if (inEdit)
            {
                return;
            }
            if (direction == ScrollBarDirection.HORIZONTAL)
            {
                _scrollTarget.scrollH = scrollPosition;
            }
            else
            {
                _scrollTarget.scrollV = scrollPosition;
            }
            return;
        }// end function

        override protected function draw() : void
        {
            if (isInvalid(InvalidationType.DATA))
            {
                updateScrollTargetProperties();
            }
            super.draw();
            return;
        }// end function

        public function set scrollTarget(param1:TextField) : void
        {
            if (_scrollTarget != null)
            {
                _scrollTarget.removeEventListener(Event.CHANGE, handleTargetChange, false);
                _scrollTarget.removeEventListener(TextEvent.TEXT_INPUT, handleTargetChange, false);
                _scrollTarget.removeEventListener(Event.SCROLL, handleTargetScroll, false);
                removeEventListener(ScrollEvent.SCROLL, updateTargetScroll, false);
            }
            _scrollTarget = param1;
            if (_scrollTarget != null)
            {
                _scrollTarget.addEventListener(Event.CHANGE, handleTargetChange, false, 0, true);
                _scrollTarget.addEventListener(TextEvent.TEXT_INPUT, handleTargetChange, false, 0, true);
                _scrollTarget.addEventListener(Event.SCROLL, handleTargetScroll, false, 0, true);
                addEventListener(ScrollEvent.SCROLL, updateTargetScroll, false, 0, true);
            }
            invalidate(InvalidationType.DATA);
            return;
        }// end function

        override public function get direction() : String
        {
            return super.direction;
        }// end function

        public static function getStyleDefinition() : Object
        {
            return UIComponent.mergeStyles(defaultStyles, ScrollBar.getStyleDefinition());
        }// end function

    }
}
