class Node
{
  String word;
  int x;
  int y;
  int r;
  int g;
  int b;
  
  public Node(String word, int x, int y, int r, int g, int b)
  {
    this.word = word;
    this.x = x;
    this.y = y;
    this.r = r;
    this.g = g;
    this.b = b;
    
  }

  public void show()
  {
    fill(r, g, b);
    ellipse(x, y, 75, 75);
    fill(0);
    text(word, x-11, y+5);
  }  
  
  public int getX()
  {
    return x;
  }
  
  public int getY()
  {
    return y;
  }
  
  public String getWord()
  {
    return word;
  }
}
