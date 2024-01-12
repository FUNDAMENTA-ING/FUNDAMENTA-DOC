### **AUTOLISPS**

<table >
  <tbody>
        <tr>
      <td align="center" valign="top" width="30px">01</td>
      <td align="left" valign="top" width="300px"><a href="https://github.com/FUNDAMENTA-ING/FUNDAMENTA-DOC/blob/main/DOCS/DATOS%20GENERALES%20-%20CYPE.md">MEASUREMENTS</a></td>
      <td align="left" valign="top" width="500px">Suma longitudes, areas etc.</td>
    </tr>
    <tr>
      <td align="center" valign="top" width="30px">02</td>
      <td align="left" valign="top" width="300px"><a href="https://github.com/FUNDAMENTA-ING/FUNDAMENTA-DOC/blob/main/DOCS/DATOS%20GENERALES%20-%20CYPE.md">ROUD</a></td>
      <td align="left" valign="top" width="500px">Redondea txt y mtxt</td>
    </tr>
    <tr>
      <td align="center" valign="top" >03</td>
      <td align="left" valign="top" ><a href="https://github.com/FUNDAMENTA-ING/FUNDAMENTA-DOC/blob/main/DOCS/AUTOCADCOMANDS.md">TRUSS</a></td>
      <td align="left" valign="top" >Dibuja cercha</td>
    </tr>
        <tr>
      <td align="center" valign="top" >04</td>
      <td align="left" valign="top" ><a href="https://github.com/FUNDAMENTA-ING/FUNDAMENTA-DOC/blob/main/DOCS/AUTOCADCOMANDS.md">NUMBINC</a></td>
      <td align="left" valign="top" >Numera automaticamente</td>
    </tr>
            <tr>
      <td align="center" valign="top" >05</td>
      <td align="left" valign="top" ><a href="https://github.com/FUNDAMENTA-ING/FUNDAMENTA-DOC/blob/main/DEV/AUOTCADLISP/InsertC.VLX">INSERTC</a></td>
      <td align="left" valign="top" >Numera automaticamente con seleccion multiple *</td>
    </tr>
                <tr>
      <td align="center" valign="top" >06</td>
      <td align="left" valign="top" ><a href="https://github.com/FUNDAMENTA-ING/FUNDAMENTA-DOC/blob/main/DEV/AUOTCADLISP/lay.lsp">DUPLAYOUT</a></td>
      <td align="left" valign="top" >Crea multiples copias de hojas automaticamente </td>
    </tr>
                    <tr>
      <td align="center" valign="top" >07</td>
      <td align="left" valign="top" ><a href="https://github.com/FUNDAMENTA-ING/FUNDAMENTA-DOC/blob/main/DEV/AUOTCADLISP/relay.lsp">RELAYS</a></td>
      <td align="left" valign="top" >Renombra multiples hojas </td>
    </tr>
      </tbody>
</table>
  

*(setq insertc:AttNo 2) este codigo define el segundo atributo como valor a numerar (OJO escribir entre parentesis el comando si o si !!!! )

Load with the CUI  
Run the CUI (Command).  
Select the 'acad(lt).cuix'(or a custom partial .cuix).  
Select LISP files and Right-Mouse Click.  
Select Load LISP from the context menu.  
Browse to the location of the LISP to add and select the file.  
Click Apply and Close to exit the CUI editor.  
 

### COMANDOS


XL + h  | trazar una linea horizontal  
insert | puedo insertar un bloque dinamico  

MODELO --> select + wipeout +space(polilinea)+erase(yes) transparency 35 v 50  
PAPEL --> Wipeout+Frames+Display but not plot|regen

attsync | sincronizar y editar util en los rotulos (editar bloques en editor de bloques a los rotulos)

ncopy | dentro de un bloque puedo copiar elementos de otro bloque

attdef | creo un texto con un valor de un atributo

dimedit | edito una cota de anotate pouedo restaurarla a home

UCS | cambiamos la orientacion de los ejes X/Y

### CHINOS 

  esc 0.001 | escalar lo q manda saxum con esta escala

### ESPACIO PAPEL
> [!NOTE]  
> Hold the CTRL button down after you select one or more, and drag/drop. The more you select, the more you copy. Repeat until you get 20-30 and so on: there is no "copy this layout 20 times" option.


### REPLANTEO

 1- Annotate - asegurarse de que se este en capa cotas (linas azules)  
 2- Acumulativa LM  
 3- Seleccionar punto a replantear y luego eje  
 4- A la derecha y arriba se acotara como A+COTA v 1+COTA abajo y a la izq como -   

### ENVIO
Poner todo como un solo archivo  
External reference + Bind + insert (convino los archivos refernciados)  

### AUTOCAD 3D 

- Luego de sacar desde vista 3d y pasar a cypecad, vamos a vista 3d modelling, seleccionamos todo le damos a la flechita y ponemos create mesh,(destildamos use optimized... y seleccionamos mosly quads)
- Le damos a section plane y seleccionamos una cara, esto nos creara un plano
- Le damos a la flechita de section y elejimos lo q mas nos guste ponemos escala y angulo y ya tenemos nuestro plano:D
- 

