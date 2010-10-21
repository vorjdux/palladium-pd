package com.matheushenrique.palladium
{

import com.matheushenrique.palladium.core.*;
import com.matheushenrique.palladium.PdTooltip;

import flash.display.*;
import com.greensock.TweenLite;
import flash.events.Event;
import flash.events.MouseEvent;

/**
 * Palladium (Pd) AS3 Framework (http://pd.matheushenrique.com)
 * 
 * PdLightBox is an extremely fast, lightweight, and flexible. 
 * <b>Copyright 2010, Matheus Henrique. All rights reserved.</b>
 * 
 * @author Matheus Henrique dos Santos, contact@matheushenrique.com
 */
 
public class PdLightBox extends Sprite
{
    
    private var _backGround:Sprite;
    
    private var _params:Object = {
        backGroundColor: 0,
        backGroundAlpha: 0.3,
        content:null,
        tooltip:null
    };
    
    public function PdLightBox() {
        if (extra_params) Pd.extend(_params, extra_params);
        this.addEventListener(Event.ADDED_TO_STAGE, init);
    }
    
    private function init(e:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, init);
        this.alpha = 0;
        this.visible = false;
        _backGround = new Sprite;
        this.addChild(_backGround);
        this.draw();
        return;
    }
    
    private function draw():void {
        _backGround.graphics.beginFill(_backGroundColor, _backGroundAlpha);
        _backGround.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
        _backGround.graphics.endFill();
        _backGround.buttonMode = true;
        _backGround.useHandCursor = false;
        stage.addEventListener(Event.RESIZE, align);
        this.addEventListener(MouseEvent.CLICK, close);
        return;
    }
    
    private function align(e:Event = null):void {
        _backGround.width = stage.stageWidth;
        _backGround.height = stage.stageHeight;
        if (_content!=null) {
            _content.removeEventListener(Event.ADDED_TO_STAGE, align);
            _content.x = (stage.stageWidth - _content.width) >> 1;
            _content.y = (stage.stageHeight - _content.height) >> 1;
        }
        return;
    }
    
    private function close(e:MouseEvent):void {
        this.hide();
        return;
    }
    
    public function show(time:Number = Pd.animationTime, extra_params:Object = null):void {
        var params:Object = {alpha: 1};
        if (extra_params) Pd.extend(params, extra_params);
        this.visible = true;
        TweenLite.to(this, time,  params);
        return;
    }
    
    public function hide(time:Number = Pd.animationTime , extra_params:Object = null):void {
        var params:Object = {alpha:0, onComplete:function():void { visible = false; }};
        if (extra_params) Pd.extend(params, extra_params);
        TweenLite.to(this, time, params);
        return;
    }
    
    public function destroy():void {
        _backGround.graphics.clear();
        stage.removeEventListener(Event.RESIZE, align);
        this.removeEventListener(MouseEvent.CLICK, close);
        return;
    }
    
    /**
    * Getters and Setters
    */
    public function get backGroundColor():uint { return _backGroundColor; }
    public function set backGroundColor(value:uint):void { if (value !== _backGroundColor) { _backGroundColor = value; }}
    
    public function get backGroundAlpha():Number { return _backGroundAlpha; }
    public function set backGroundAlpha(value:Number):void { if (value !== _backGroundAlpha) { _backGroundAlpha = value; }}
    
    public function get content():* { return _content; }
    public function set content(value:*):void { 
        if (value !== _content) { 
            if (_content) this.removeChild(_content); 
            _content = value;
            _content.addEventListener(Event.ADDED_TO_STAGE, align);
        }
    }
    
    public function get tooltip():PdTooltip { return _tooltip; }
    public function set tooltip(value:PdTooltip):void { 
        if (value !== _content) { 
            if (_tooltip) this.removeChild(_tooltip); 
            _tooltip = value;
            addChild(_tooltip);
            if (_tooltip) _tooltip.text = "eh nozes";
        }
    }
    
}

}