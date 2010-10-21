package com.matheushenrique.palladium
{

import com.matheushenrique.palladium.core.*;
import com.matheushenrique.palladium.PdTextField;
import com.greensock.TweenLite;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

/**
 * Palladium (Pd) AS3 Framework (http://pd.matheushenrique.com)
 * 
 * PdTooltip is an extremely fast, lightweight, and flexible. 
 * <b>Copyright 2010, Matheus Henrique. All rights reserved.</b>
 * 
 * @author Matheus Henrique dos Santos, contact@matheushenrique.com
 */

public class PdTooltip extends Sprite
{
    
    private var _backGround:Sprite;
    
    private var _textField:PdTextField = new PdTextField;
    
    private var _params:Object = {
        backGroundColor: 0,
        backGroundAlpha: 0.3,
        boxDistance: 0,
        innerSpace: Pd.innerSpace
    };
	
	public function PdTooltip(extra_params:Object = null) {
	    if (extra_params) Pd.extend(_params, extra_params);
		this.addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event):void {
	    stage.addEventListener(MouseEvent.MOUSE_MOVE, align);
        this.removeEventListener(Event.ADDED_TO_STAGE, init);
        this.alpha = 0;
        this.visible = false;
        _backGround = new Sprite;
        _backGround.buttonMode = true;
        _backGround.useHandCursor = false;
        _backGround.addChild(_textField);
        this.addChild(_backGround);
        this.draw();
        
        return;
    }
    
    private function draw():void {
        _backGround.graphics.clear();
        _backGround.graphics.beginFill(_params.backGroundColor, _params.backGroundAlpha);
        _backGround.graphics.drawRect(0, 0, _textField.width+_innerSpace, _textField.height+_params.innerSpace);
        _backGround.graphics.endFill();
        _textField.x = _textField.y = _params.innerSpace >> 1;
        
        return;
    }
    
    private function align(e:MouseEvent):void {
        var mX:int = e.stageX+_boxDistance;
        var mY:int = e.stageY+_boxDistance;
        
        if (_boxDistance > e.stageX)
            mX = _boxDistance;
        
        if (_boxDistance > e.stageY)
            mY = _boxDistance;
        
        if ((mX+this.width)>stage.stageWidth)
            mX = mX - ((mX+this.width)-stage.stageWidth) - _boxDistance;
            
        if ((mY+this.height)>stage.stageHeight)
            mY = mY - ((mY+this.height)-stage.stageHeight) - _boxDistance;
        
        TweenLite.to(this, Pd.animationTime, {x: mX, y: mY});
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
    
    public function hide(time:Number = Pd.animationTime, extra_params:Object = null):void {
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
    public function get text():String { return _textField.text; }
    public function set text(value:String):void { if (value !== _textField.text) { _textField.text = value; this.draw(); } }
    
	
}

}

