package com.matheushenrique.palladium.core
{
    
/**
 * Palladium (Pd) AS3 Framework 0.001 (http://pd.matheushenrique.com)
 * 
 * @author: Matheus Henrique dos Santos, contact@matheushenrique.com
 *
 * @langversion ActionScript 3.0
 * @playerversion Flash 10.0
 * 
 * <b>Copyright 2010, Matheus Henrique. All rights reserved.</b>
 */
 
/**
 * 
 * What is Palladium? What is 'Pd'?
 * --------------------------------
 * 
 * Palladium (pronounced /pəˈleɪdiəm/, pə-LAY-dee-əm) is a chemical element with the chemical 
 * symbol Pd and an atomic number of 46. Palladium is a rare and lustrous silvery-white metal 
 * that was discovered in 1803 by William Hyde Wollaston, who named it after the asteroid 
 * Pallas, which was named after the epithet of the Greek goddess Athena, acquired by her 
 * when she slew Pallas.
 * 
 * Palladium, along with platinum, rhodium, ruthenium, iridium and osmium form a group of 
 * elements referred to as the platinum group metals (PGMs). Platinum group metals share 
 * similar chemical properties, but palladium has the lowest melting point and is the least 
 * dense of these precious metals.
 * 
 * The unique properties of palladium and other platinum group metals account for their 
 * widespread use. 
 * One in four goods manufactured today either contain platinum group metals or had platinum 
 * group metals play a key role during their manufacturing process.[2] Over half of the supply 
 * of palladium and its congener platinum goes into catalytic converters, which convert up to 90% 
 * of harmful gases from auto exhaust (hydrocarbons, carbon monoxide and nitrogen oxide) into less 
 * harmful substances (nitrogen, carbon dioxide and water vapor). Palladium is found in many 
 * electronics including computers, mobile phones, multi-layer ceramic capacitors, component plating, 
 * low voltage electrical contacts, and SED/OLED/LCD televisions. Palladium is also used in dentistry, 
 * medicine, hydrogen purification, chemical applications, and groundwater treatment. Palladium plays 
 * a key role in the technology used for fuel cells, which combines hydrogen and oxygen to produce 
 * electricity, heat and water.
 * 
 * Ore deposits of palladium and other platinum group metals are rare, and the most extensive deposits 
 * have been found in the norite belt of the Bushveld Igneous Complex in the Transvaal in South Africa, 
 * the Stillwater Complex in Montana, United States, the Sudbury District of Ontario, Canada, and the 
 * Norilsk Complex in Russia. In addition to mining, recycling is also a source of palladium, mostly 
 * from scrapped catalytic converters. The numerous applications and limited supply sources of palladium 
 * result in palladium drawing considerable investment interest.
 * 
 */
 
    public class Pd
    {
        
		public static const version:Number = 0.001;
		public static const animationTime:Number = 0.3;
		public static const innerSpace:uint = 5;
		public static const debugMode:Boolean = false;
        
        public function Pd() {
            return;
        }
        
       /**
        * Extend two objects
        * @param targetObject
        * @param sourceObject
        */ 
        public static function extend(targetObject:Object, sourceObject:Object):void {
    	    for (var key:Object in sourceObject) {
    	        try {
    	            targetObject[key] = sourceObject[key];
    	        } catch(e:Error) {
    	            if (debugMode) trace("Exception caught where '"+targetObject+"."+key+"' was invoked.");
    	        }
    	        
	        }
    	    return;
    	}
    	
    	public static function addChildren(targetObject:DisplayObject, childrenList:Array):void {
    	    for each (var childObject:DisplayObject in childrenList) {
    	        targetObject.addChild(childObject);
    	    }
    	    
    	    return;
    	}
    	
    	public static function deg2rad(deg:Number):Number {
    	    return deg * (Math.PI/180);
    	}
        
    }
}