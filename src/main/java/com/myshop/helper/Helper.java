
package com.myshop.helper;

public class Helper {
    public static String get10Words(String desc){
        String[] strs = desc.split(" ");
        
        if(strs.length>10){
            
            String result="";
            for(int i=0;i<10;i++){
                
                result=result+strs[i]+" ";
                
            }
            
            return (result+"...");
            
        }else{
            
            
            return (desc+"...");
        }
    }
}
