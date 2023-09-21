package repository;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import domain.BookDto;

public class BookDao {
  
  // mybatis의 SqlSession을 만들 수 있는 SqlSessionFactory 선언
  private SqlSessionFactory factory;
  
  // Singleton Pattern
  private static BookDao dao = new BookDao();  // BookDao타입의 dao 생성 (2교시 수업 듣고 주석 다시 정리)
  private BookDao () {            // 생성자 호출, 외부에서 BookDao를 건들지 못하게 처리
    // SqlSessionFactory 생성
    try {
      String resource = "mybatis/config/mybatis-config.xml";
      InputStream in = Resources.getResourceAsStream(resource);  // mybatis에 ㅇ
      factory = new SqlSessionFactoryBuilder().build(in);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  public static BookDao getDao() {
    return dao;
  }
  
  // 매퍼의 namespace
  private final String NS = "mybatis.mapper.book.";
  
  // 전체 개수 반환 메소드
  public int bookCount() {
    SqlSession ss = factory.openSession();  // openSession은 커밋 대상이 아님
    int count = ss.selectOne(NS + "bookCount");   // selectOne : select결과가 1개
    ss.close();
    return count;
  }
  
  // 목록 반환 메소드
  public List<BookDto> bookList(Map<String, Object> map){
    SqlSession ss = factory.openSession();
    List<BookDto> list = ss.selectList(NS + "bookList", map);  // selectList : select 결과가 여러개인 경우
    ss.close();
    return list;
  }
  
  // 상세 반환 메소드
  public BookDto bookDetail(int bookNo) {
    SqlSession ss = factory.openSession();
    BookDto dto = ss.selectOne(NS + "bookDetail", bookNo);
    ss.close();
    return dto;
  }
  
  // 등록 메소드
  public int bookAdd(BookDto dto) {
    SqlSession ss = factory.openSession(false);  // 수동 커밋하겠다는 의미(false : 오토커밋 하지말라는 뜻)
    int addResult = ss.insert(NS + "bookAdd", dto);
    if(addResult == 1) {
      ss.commit();
    }
    ss.close();
    return addResult;
  }
  
  // 수정 메소드
  public int bookModify(BookDto dto) {
    SqlSession ss = factory.openSession(false);
    int modifyResult = ss.update(NS + "bookModify", dto);
    if(modifyResult == 1) {
      ss.commit();
    }
    ss.close();
    return modifyResult;
  }
  
  // 삭제 메소드
  public int bookDelete(int bookNo) {
    SqlSession ss = factory.openSession(false);
    int deleteResult = ss.delete(NS + "bookDelete", bookNo);
    if(deleteResult == 1) {
      ss.commit();
    }
    ss.close();
    return deleteResult;
  }  
  
}
