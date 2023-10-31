package repository;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import domain.StudentDto;

public class StudentDao {

  private SqlSessionFactory factory;
  
  private static StudentDao dao = new StudentDao();
  private StudentDao() {
    try {
      String resource = "mybatis/config/mybatis-config.xml";
      InputStream in = Resources.getResourceAsStream(resource);
      factory = new SqlSessionFactoryBuilder().build(in);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  public static StudentDao getDao() {
    return dao;
  }
  
  private final String NS = "mybatis.mapper.student.";
  
  // 1. 목록
  public List<StudentDto> studentList() {
    SqlSession ss = factory.openSession();
    List<StudentDto> students = ss.selectList(NS + "studentList");
    ss.close();
    return students;
  }
  
  // 2. 전체 학생 수
  public int studentCount() {
    SqlSession ss = factory.openSession();
    int count = ss.selectOne(NS + "studentCount");
    ss.close();
    return count;
  }
  
  // 3. 전체 점수 평균
  public double studentAverage() {
    SqlSession ss = factory.openSession();
    double average = ss.selectOne(NS + "studentAverage");
    ss.close();
    return average;
  }
  
  // 4. 삽입
  public int studentAdd(StudentDto student) {
    SqlSession ss = factory.openSession(false);
    int addResult = ss.insert(NS + "studentAdd", student);
    if(addResult == 1) {
      ss.commit();
    }
    ss.close();
    return addResult;
  }
  
  // 5. 학생 조회
  public List<StudentDto> queryStudentList(Map<String, Double> map) {
    SqlSession ss = factory.openSession();
    List<StudentDto> students = ss.selectList(NS + "queryStudentList", map);
    ss.close();
    return students;
  }
  
  // 6. 조회된 학생 수
  public int queryStudentCount(Map<String, Double> map) {
    SqlSession ss = factory.openSession();
    int count = ss.selectOne(NS + "queryStudentCount", map);
    ss.close();
    return count;
  }
  
  // 7. 조회된 학생 점수 평균
  public double queryStudentAverage(Map<String, Double> map) {
    SqlSession ss = factory.openSession();
    double average = ss.selectOne(NS + "queryStudentAverage", map);
    ss.close();
    return average;
  }
  
  // 8. 삭제
  public int studentDelete(int stuNo) {
    SqlSession ss = factory.openSession(false);
    int deleteResult = ss.delete(NS + "studentDelete", stuNo);
    if(deleteResult == 1) {
      ss.commit();
    }
    ss.close();
    return deleteResult;
  }
  
  // 9. 상세
  public StudentDto studentDetail(int stuNo) {
    SqlSession ss = factory.openSession();
    StudentDto student = ss.selectOne(NS + "studentDetail", stuNo);
    ss.close();
    return student;
  }
  
  // 10. 수정
  public int studentModify(StudentDto student) {
    SqlSession ss = factory.openSession(false);
    int modifyResult = ss.update(NS + "studentModify", student);
    if(modifyResult == 1) {
      ss.commit();
    }
    ss.close();
    return modifyResult;
  }
  
  // 11. TOP3
  public List<StudentDto> top3List() {
    SqlSession ss = factory.openSession();
    List<StudentDto> top3 = ss.selectList(NS + "top3List");
    ss.close();
    return top3;
  }
  
}
