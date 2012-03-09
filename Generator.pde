import controlP5.*;
import oscP5.*;
import netP5.*;
import java.util.ArrayList;

int s = 0;
boolean ready = false;

int y = 40;
int x = 400;
ArrayList<String> words = new ArrayList<String>();
ArrayList<ArrayList> optionS = new ArrayList<ArrayList>();


int iteration = 0;
OscP5 oscP5;
NetAddress myRemoteLocation;
ControlP5 cp5;
Textarea myTextarea;

void setup() {
  smooth();
  cp5 = new ControlP5(this);
  oscP5 = new OscP5(this,12000);
  size(1440, 900);
  frameRate(2);
  background(238,207,161);  
  
  myTextarea = cp5.addTextarea("txt")
                  .setPosition(1200,0)
                  .setSize(240,900)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(0))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
                  ;
}

void oscEvent(OscMessage theOscMessage) {  
  String currentWord = theOscMessage.addrPattern();
  if(currentWord.substring(0, 1).equals("%"))
  {
    words.add(currentWord.substring(1));
   // new Node(currentWord.substring(1), y, x, int(random(255)), int(random(255)), int(random(255)));
    iteration++;
  }else if(currentWord.substring(0, 1).equals("@"))
  {
    //print(currentWord);
    String cleanString = currentWord.replaceAll("@|\'", "").replaceAll("]", "");
    String[] options = cleanString.split(",");
    options[0] = options[0].substring(1);
    
    
    ArrayList<Node> optionNodes = new ArrayList<Node>();
    for(int p = 0; p < options.length; p++)
    {
      optionNodes.add(new Node(options[p], int(random(1440)), int(random(700)), 255, 255, 255));
    }
    optionS.add(optionNodes);
    
  }else if(currentWord.equals("MAX"))
  {
    println("Ready!");
    ready = true;
  }
  
}
void draw()
{
  background(238,207,161); 
  if(ready){
    new Node(words.get(s), 1440/2, 900/2, int(random(255)), int(random(255)), int(random(255))).show();
    myTextarea.setText(myTextarea.getText()+ " " +words.get(s));
    for(int w = 0; w < optionS.get(s).size()-1; w++)
    {
      Node currentNode = (Node)optionS.get(s).get(w);
      currentNode.show();
    }
    
    
    s++;
  }
}

