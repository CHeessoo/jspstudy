package ex04_el;

public class Person {
  
  // field
  private String name;
  private int age;
  
  // constructor
  public Person() {
    //TODO Auto-generated constructor stub
  }
  public Person(String name, int age) {
    super();
    this.name = name;
    this.age = age;
  }
  
  // getter/setter
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public int getAge() {
    return age;
  }
  public void setAge(int age) {
    this.age = age;
  }
  
}
