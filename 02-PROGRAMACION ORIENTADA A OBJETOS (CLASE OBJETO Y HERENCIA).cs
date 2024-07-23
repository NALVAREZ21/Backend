//PROGRAMACION ORIENTADA A OBJETOS (POO)
using System;
public class HelloWorld
{
    public static void Main(string[] args)
    {
         //FORMAS DE CREAR OBJETOS
         /*Ventas venta = new Ventas();
         venta.set_total(14);
         Console.WriteLine("Total: " + venta.get_total());  */
         
         //NO ES EL MISMO QUE EL VAR DE JS (AXUCAR SINTATICA)
        // var ventas = new Ventas(123) ;
         //Console.WriteLine("Total: " + ventas.get_total());
         ///Console.WriteLine(ventas.GetInfo());
         
         VentasConImpuestos vci = new VentasConImpuestos(31,2.3m);
         Console.WriteLine(vci.GetInfo());
    }  
}
//LA DIFERENCIA ENTRE PRIVATE Y PROTECTED ES QUE 
//PRIVATE: SOLO SE PUEDE ACCEDER DESDE LA MISMA CLASE (NI CLASE HIJA) 
//PROTECTED : PUEDEN ACCEDER DESDE LA MISMA CLASE O LOS HIJOS QUE HEREDAN //DE ELLA 
class VentasConImpuestos : Ventas{ 
    
    private decimal _impuesto;
    /*public void set_impuesto(decimal impuesto){
        _impuesto = impuesto;
    }*/
    public decimal get_impuesto(){
        return _impuesto;
    }
    public VentasConImpuestos(decimal total,decimal _impuesto) : base(total)
    { 
         this._impuesto = _impuesto;
    }
    //LA SOBRESCRITURA EXISTE DENTRO DE LA HERENCIA CUANDO TENGO METODO EN PADRE Y QUIERO QUE EXISTA MODIFICADO EN EL HIJO 
    public override string  GetInfo()
    {
        return "El total es $" + _total + " el impuesto es $" + _impuesto;
    }
}
class Ventas {
    //ES BUENA PRACTICA ESCRIBIR ASI A LOS ATRIBUTOS DE UNA CLASE
    protected decimal _total;
    
    // SI SOLO QUIERO ACCEDER A ESTA PROPIEDAD PUEDO USAR SOLO
    // EL GET Y SI QUIERO MODIFICARLA QUITO EL GET
    // EL GET SI PUEDE ESTAR SOLO PERO NO SOLO EL SET
    public void set_total(decimal total)
    {
        _total = total; 
    }
    public decimal get_total(){
        return _total;
    }
    //EL METODO CONSTRUCTOR ES UN METODO QUE LE DARA
     //LOS VALORES INICIALES A LOS ATRIBUTOS DE UNA CLASE.
    public Ventas (decimal total)
    {
        _total = total;
    }
    //ESTO INDICA QUE EL METODO PODRA SER SOBREESCRITO
    public virtual string  GetInfo(){
        return "El total es $ "+ _total;
    }
}