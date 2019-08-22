/* File : example.h */

class Thing {
public:
  Thing() : x(5), y(6) { }

  int x, y;
};

class Thing2 {
public:
  Thing2() : x(7), y(8), z(9) { }

  int x, y, z;
};

class MyThings {
public:
  MyThings() : a() {
    b = new Thing2();
  }
  ~MyThings() {
    if (b) {
      delete b;
    }
  }

  Thing a;
  Thing2 *b;
};

class Shape {
public:
  Shape() {
    nshapes++;
  }
  virtual ~Shape() {
    nshapes--;
  }
  double  x, y;
  void    move(double dx, double dy);
  virtual double area() = 0;
  virtual double perimeter() = 0;
  static  int nshapes;
};

class Circle : public Shape {
private:
  double radius;
public:
  Circle(double r) : radius(r) { }
  virtual double area();
  virtual double perimeter();
};

class Square : public Shape {
private:
  double width;
public:
  Square(double w) : width(w) { }
  virtual double area();
  virtual double perimeter();
};
