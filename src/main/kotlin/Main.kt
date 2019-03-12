import Hack.Assembler.HackAssembler
import java.io.File
import java.io.PrintWriter


fun main(args: Array<String>) {

    var stack: Int = 0

    val f: File = File("div.asm")
    val outfile: PrintWriter = File("div-out.asm").printWriter()
    for(line in f.readLines()) {
        var out: String = line
        if(line.startsWith("#call",ignoreCase = true)) {
            out = ""
            if(!(line.split(" ").size > 1)) throw Exception("#call must contain at least one parameter")
            stack++

            out += ("@15\n")
            out += ("M=M+1\n")
            out += ("D=A\n")
            out += ("A=D+M\n")
            out += ("D=A\n")
            out += "@14\n"
            out += "M=D\n"

            out += "@STACK${stack}\n"
            out += ("D=A\n")
            out += "@14\n"
            out += "A=M\n"
            out += "M=D\n"


            out += ("@${line.split(" ")[1]}\n")
            out += ("0;JMP\n")
            out += ("(STACK${stack})\n")
        }
        if(line.startsWith("#ret",ignoreCase = true)) {
            out = ""
            out += "@15\n"
            out += "D=M\n"
            out += "M=M-1\n"
            out += "A=A+D\n"
            out += "A=M\n"
            out += "0;JMP\n"
        }
        outfile.println(out)
    }
    outfile.close()
//    val assembler = HackAssembler("div-output",32768, 0, true)

}