
package codigo;
import java.io.FileWriter;
import java.io.IOException;
import java.io.File;

%%
%unicode
%class Lexer
%int
%line
%column
%caseless

%{
	private FileWriter writer;

	private void writer(String buff){
		try {
            writer.write(buff);
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
%}

%init{
	try{
               File f= new File("./DataSet.txt");
               f.delete();
		writer = new FileWriter("DataSet.txt", true);
	}catch(IOException e){
		e.printStackTrace();
	}
%init}

%eof{
	try {
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
%eof}

EliminarEsto =  as |zx| at | be |dm |zy |mo|dh |Anyone |mu|wt |eqd |nqgj |gn| ycfl |qyn |qsm| ds | dq | jxzg|lmao|lgko|vq|yw
|ag|bv|ya|em|oy|dj|sk|dz|dl|Nah |rjrcs |gt |re |zrn |ozw |dr|yo|subredditmessagecomposetorwallstreetbets|anyone |pm | nf 
| zpy | wz | ur | pump|Su |obef | dfomqwa | zukv| uze | ukx | bm | bitch | because | pu | geci | been | before | dfolzyu 
| qtbk | HEHEHEH | being | below | between | both |  ejburritos | but | by | can | can't | cannot | could | couldn't | did 
| didn't | do | does | doesn't | doing | don't | down | during | deleted | each | few | for | from | further| fuck | Fucking 
|faggot| stupid | fucking | had | hadn't | has | hasn't | have | haven't | having | he | he'd | he'll | he's | her | here 
| here's | hers | herself | him | himself | his | how | how's | i | i'd | i'll | i'm | i've | if | in | into | is | isn't 
| it | it's | its| vq | itself | let's | me | more | most | mustn't | my | myself| anyway | once | only | or | other | ought 
| our | ours | ourselves | out | over | own | same | shan't | nqgj  | she | she'd | she'll | she's | should | shouldn't | so 
| some | such | than | that | that's | the | their | theirs | them | themselves | then | there|TrueLibertyorDeath | there's 
| these | they | they'd | they'll | they're | they've| bv |ag |yw | xa | this | those | through | to | too | under | until 
| up | very | was | wasn't | we | we'd | we'll | we're | we've | were | weren't | what | what's | when | when's | where 
| where's | which | while | who | who's | whom | why | why's | with | won't | would | wouldn't | you | you'd | you'll 
| you're | you've | your | yours | yourself | yourselves | quot | arent | cant | couldnt | didnt | doesnt | dont | hadnt 
| hasnt | havent | hed | hes | heres | hows | im | ive | isnt | its | shes | shouldnt | shit | thats | theres | theyd 
| theyll | theyre | theyve | wasnt | a+ | about | above | after | again | against | all | th | am | an | and | any | are 
| aren't | wed | weve | were  | wouldnt | youd | youll | youre | youve | twice | just | like | likely | later | try | even 
| will | simply | almost | get | ok | must | else | without | put | unless | much | ah | yeah | maybe | need | also | used 
| may | yet | obviously | obvious | many | us | use | etc | oh | since | yah | come | knows | know | knew | yes | true 
| something | really | anything | sense | b+ | c+ | d+ | e+ | f+ | g+ | h+ | i+ | j+ | k+ | l+ | m+ | n+ | o+ | p+ | q+ 
| r+ | s+ | t+ | u+ | v+ | w+ | x+ | y+ | z+ | lol | within | it'll | ha+ | HA+ | ja+| je+ | wallstreetbets | True 
| False|ea |di |wsb | dx |cut | werent | whats | whos | whys | wont|penis | no | nor | not | of | off | on

mala = {malo}{palabra}
malo = dfo | qmt | qtb | dty | dtx | ecw | aaz | dh | AMAT | zz | zy | zx | zv | zw | AAA | zuu | zuf | zt | zs | yw | AAHAHA 
| EEE | shit | qsm | woo | WOO | vjq | vjp | ebn | zucc |zrn 
palabra = [a-zA-Z]+
numero = [0-9]+
espacio = [^\x00-\x7F]+ | [\r\s\v\f]+ 
espaciosGrandes = \n | "	"
fecha = {numero}\-{numero}\-{numero} 
hora = {numero}\:{numero}\:{numero}
coma = ,
format = &gt

%%
<YYINITIAL>{
        {mala}                 {}
	{format}		{}
	{EliminarEsto}		{}
	{palabra} 		{writer(yytext());}
	{espaciosGrandes} 		{writer(yytext());}
	{espacio} 		{writer(" ");}
        ,                    {writer(" ");}
	. 				{}
}