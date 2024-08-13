#include <Atom.h>

class Sandbox : public Atom::Application
{
  public:
    Sandbox(){

    }

    ~Sandbox(){

    }
};

void main(){
  Sandbox *sandbox = new Sandbox();
  sandbox->Run();
  delete sandbox;
}