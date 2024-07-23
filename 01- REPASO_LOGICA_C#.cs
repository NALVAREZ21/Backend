using System;
using System.Collections; // PARA PODER USAR ARRAYLIST

public class HelloWorld
{
    //FUNCIONES
    //FORMA RESUMIDA DE CREAR FUNCION 
    public static int SumarValores (int num1, int num2) => num1+num2; 
    
    public static double CalcularSalario (int cantidad_horas, double valor_hora)
    {
        return cantidad_horas * valor_hora;
    }
    public static void Saludar ()
    {
        Console.WriteLine("Hola!");
    }
    public static void Main(string[] args)
    {
      Console.WriteLine(SumarValores(2,3));
      int edad = 20;
      ++edad; // es equivalente a edad++ o edad = edad +1
      Console.WriteLine(edad);
        
      // SI DECLARO UNA VARIABLE CON VAR SOLO DETERMINARA A QUE TIPO DE DATO Y NO 
      //PERMITE CAMBIARLE EL TIPO DE DATO ASIGNADO
        //var EdadPersona = 27;
        //Console.WriteLine(EdadPersona);
        
        Console.WriteLine("Ingrese la cantidad de horas trabajadas: ");
        int cantidad = Int32.Parse(Console.ReadLine());
        Console.WriteLine("Ingrese el valor por cada hora: ");
        double valor = Double.Parse(Console.ReadLine());
        double resultado = CalcularSalario(cantidad,valor);
        Console.WriteLine("Salario: " + resultado);
        
        //INVOCO AL PROCEDIMIENTO
        Saludar();
        
        Console.Write("Digite un numero: ");
        int numero = Int32.Parse(Console.ReadLine());
        
        if(numero % 2 == 0 )
        { 
           Console.WriteLine($"El numero {numero} es par"); 
        }
        else
        {
            Console.WriteLine($"El numero {numero} es impar");
        }
         //ESTRUCTURA SELECTIVA SWITCH
        Console.Write("Ingresa tu vocal favorita: ");
        char vocal = char.Parse(Console.ReadLine());
        switch(vocal)
        {
            case 'a' : 
            {
                Console.WriteLine("Elegi la vocal A");
                break;
            }
            case 'e' : 
            {
                Console.WriteLine("Elegi la vocal E");
                break;
            }
            case 'i' : 
            {
                Console.WriteLine("Elegi la vocal I");
                break;
            }
            case 'o' : 
            {
                Console.WriteLine("Elegi la vocal O");
                break;
            }
            case 'u' : 
            {
                Console.WriteLine("Elegi la vocal U");
                break;
            }
            default  :
            {
                Console.WriteLine("No seleccionaste una vocal...");
                break;
            }
        }
        // ESTRUCTURA DE REPETICIONES
        int i = 25;
        while(i<=50)
        { 
            Console.WriteLine(i);
            i++;
        }
        for(i=0;i<2;i++)
        {
            Console.WriteLine(i);
        }
        int iterador = 25;
        do
        {
            Console.WriteLine(iterador);
            iterador++;
        }while(iterador<30);
        Console.WriteLine(array[0]);
        
        // GENERACION NUMERO ALEATORIO
        Random numero = new Random();
        int numaleatorio = numero.Next(1,51);
        Console.WriteLine(numaleatorio);
        
        int [] numeros = new int [3];       
        numeros[0] = 10;
        numeros[1] = 12;
        numeros[2] = 14;
        for(int i=0;i<numeros.Length;i++)
        {
           Console.WriteLine(numeros[i]);
        }
        // REPASO DE VECTORES 
        string [] provincias = new string[2];
        for (int i=0;i<provincias.Length;i++)
        {
             Console.Write("Ingrese el nombre de la provincia; ");
             provincias[i] = Console.ReadLine();
        }
        for (int i=0;i<provincias.Length;i++)
        {
             Console.WriteLine("Provincia: \n" + provincias[i]);
        }
        
        LA DIFERENCIA ENTRE ARRAY Y ARRAYLIST ES QUE EL ARRAY AL SER ESTATICO
        NO PUEDE AGREGAR MAS VALORES QUE LOS PREFIJADOS MIENTRAS QUE EL ARRAYLIST
        AL SER DINAMICO SI PERMITE AGREGAR MAS ELEMENTOS DE FORMA DINAMICA
        ArrayList lista = new ArrayList();
        lista.Add(120);
        lista.Add("Hola Mundo");
        lista.Add(123.33);
        lista.Add(true);
    
        foreach(var list in lista)
        {
             Console.WriteLine(list);
        }
    }
}