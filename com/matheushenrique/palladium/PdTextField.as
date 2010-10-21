package com.matheushenrique.palladium
{

import com.matheushenrique.palladium.core.*;

import flash.display.Sprite;
import flash.text.TextFormat;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

/**
 * Palladium (Pd) AS3 Framework (http://pd.matheushenrique.com)
 * 
 * PdTextField is an extremely fast, lightweight, and flexible. 
 * <b>Copyright 2010, Matheus Henrique. All rights reserved.</b>
 * 
 * @author Matheus Henrique dos Santos, contact@matheushenrique.com
 */

public class PdTextField extends Sprite
{
    
    private var _textFieldEl:TextField;
    private var _textCallback:Function;
    
   /**
    * Constructor
    * @param extra_params
    */
    public function PdTextField(extra_params:Object = null):void
    {
        
        var params:Object = {
            // TextField params
            selectable: false,
            autoSize: TextFieldAutoSize.LEFT,
            
            // TextFormat params            
            font: "Tahoma", 
            size: 12, 
            color: 0, 
            bold: false, 
            italic: false, 
            underline: false, 
            url: null, 
            target: null, 
            align: null, 
            leftMargin: null, 
            rightMargin: null, 
            indent: null, 
            leading: null
        };
        
        if (extra_params) Pd.extend(params, extra_params);
        
        var textFieldFt:TextFormat = new TextFormat();
        
        Pd.extend(textFieldFt, params);

        _textFieldEl = new TextField();
        
        _textFieldEl.defaultTextFormat = textFieldFt;
        
        Pd.extend(_textFieldEl, params);

        addChild(_textFieldEl);
        
        return;
    }
    
    /**
    * Getters and Setters
    */
    public function get text():String { return _textFieldEl.text; }
    public function set text(value:String):void { _textFieldEl.text = value; if (_textCallback!=null) _textCallback(); }
    
    public function get htmlText():String { return _textFieldEl.htmlText; }
    public function set htmlText(value:String):void { _textFieldEl.htmlText = value; if (_textCallback!=null) _textCallback(); }
    
    public function set textCallback(value:Function):void { _textCallback = value; }
    
}

}