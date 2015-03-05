// Playground - noun: a place where people can play

import UIKit


//función que retorna un string con unidad
func Unidades(num: Float) ->String {
    var n : String = ""
    switch num {
    case 1 :
        n = "UN"
    case 2 :
        n = "DOS"
    case 3 :
        n = "TRES"
    case 4 :
        n = "CUATRO"
    case 5 :
        n = "CINCO"
    case 6 :
        n = "SEIS"
    case 7 :
        n = "SIETE"
    case 8 :
        n = "OCHO"
    case 9 :
        n = "NUEVE"
    default :
        n = ""
        
    }
    return n
}

//función que retorna un string con el valor de la decena
func Decenas(num: Float) ->String {
    
    let decena : Float = floor(num/10);
    let unidad : Float = floor(num - (decena * 10))
    var n : String = ""

    
    switch decena{
    case 1:
        switch(unidad){
        case 0:
            n = "DIEZ"
        case 1:
            n = "ONCE"
        case 2:
            n = "DOCE"
        case 3:
            n = "TRECE"
        case 4:
            n = "CATORCE"
        case 5:
            n = "QUINCE"
        default:
            n = "DIECI" + Unidades(unidad);
        }
    case 2:
        switch(unidad)
        {
        case 0:
            n = "VEINTE"
        default:
            n = "VEINTI\(Unidades(unidad))"
        }
    case 3:
        n = DecenasConY("TREINTA", unidad)
    case 4:
        n = DecenasConY("CUARENTA", unidad)
    case 5:
        n = DecenasConY("CINCUENTA", unidad)
    case 6:
        n = DecenasConY("SESENTA", unidad)
    case 7:
        n = DecenasConY("SETENTA", unidad)
    case 8:
        n = DecenasConY("OCHENTA", unidad)
    case 9:
        n = DecenasConY("NOVENTA", unidad)
    case 0:
        n = Unidades(unidad)
    default:
        n = "";
    }
    
    return n
    
}

//función para decenas con Y
func DecenasConY(strSin : String, numUnidades : Float )->String{
    if numUnidades > 0 {
        return strSin + " Y " + Unidades(numUnidades)
    }
    
    
    return strSin;
}


//función que retorna el valor de la centena y concatena el resultado de decena
func Centenas(num: Float)->String{
    var n : String = ""
    let centenas :Float = floor(num / 100);
    let decenas : Float = num - (centenas * 100);
    
    switch(centenas)
    {
    case 1:
        if (decenas > 0){
                n = "CIENTO  \(Decenas(decenas))"
        }else{
                n = "CIEN";
        }
        
    case 2:
        n = "DOSCIENTOS \(Decenas(decenas))"
    case 3:
        n = "TRESCIENTOS \(Decenas(decenas))"
    case 4:
        n = "CUATROCIENTOS \(Decenas(decenas))"
    case 5:
        n = "QUINIENTOS \(Decenas(decenas))"
    case 6:
        n = "SEISCIENTOS \(Decenas(decenas))"
    case 7:
        n = "SETECIENTOS \(Decenas(decenas))"
    case 8:
        n = "OCHOCIENTOS \(Decenas(decenas))"
    case 9:
        n = "NOVECIENTOS \(Decenas(decenas))"
    default:
        n = ""
    }
    
    return n
    
   
}

//función que retorna el valor en palabras y llama al resto de funciones
func Miles(num : Float)->String {
    var divisor : Float = 1000
    var miles :Float = floor(num / divisor)
    
    var resto : Float = num - (miles * divisor)
    
    var strMiles : String = ""
    
    switch miles {
    case 0:
        strMiles = ""
    case 1:
        strMiles = "MIL"
    default:
        strMiles = "\(Unidades(miles)) MIL"
    }
    
    
    
    
    var strCentenas : String = Centenas(resto);
    
    var strDecenas : String = Decenas(resto)
    
    
    if strMiles == "" && strCentenas != "" {
        return strCentenas
    }
    
    if strCentenas == "" && strMiles == "" {
        return strDecenas
    }
    
    if strMiles != "" && strCentenas != "" {
        return "\(strMiles) \(strCentenas)"
    }
    
    return "\(strMiles) \(strDecenas)"
}




Miles(935)

