package repository;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import domain.MemberDto;

public class MemberDao {
  
  private SqlSessionFactory factory;
  
  private static MemberDao dao = new MemberDao(); 
  private MemberDao() {
    try {
      String resource = "config/mybatis-config.xml";
      InputStream in = Resources.getResourceAsStream(resource);  // 태그까지 읽어들이기 위해 InputStream 사용
      factory = new SqlSessionFactoryBuilder().build(in);        // 읽어들인 입력스트림의 내용으로 알아서 build가 만들어진다. 
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  public static MemberDao getDao() {
    return dao;
  }
  
  private final String NS = "repository.member.";  // mapper의 namespace  // 쿼리문을 사용하기 위해서 mapper의 위치가 필요해서 미리 변수처리함
  
  public List<MemberDto> memberList() {     // 목록 보기 (메소드명과 id를 동일하게 맞춤)
    SqlSession ss = factory.openSession();  // SqlSession 생성
    List<MemberDto> list = ss.selectList(NS + "memberList");  // repository.member.memberList
    ss.close();  // sql세션 close
    return list; // 목록 반환
  }
  
  public int memberCount() {  
    SqlSession ss = factory.openSession();
    int count = ss.selectOne(NS + "memberCount"); // 결과가 정수로 전달됨
    ss.close();
    return count; // 목록 개수 반환
  }
  
  public int memberAdd(MemberDto dto) {
    SqlSession ss = factory.openSession(false);
    int addResult = ss.insert(NS + "memberAdd", dto);
    if(addResult == 1) {
      ss.commit();
    }
    ss.close();
    return addResult;
  }
  
  public MemberDto getMemberByEmail(String email) {
    SqlSession ss = factory.openSession();  // select문의 openSession은 false를 전달 x
    MemberDto dto = ss.selectOne(NS + "getMemberByEmail", email);
    ss.close();
    return dto;
  }
  
  public int memberModify(MemberDto dto) {
    SqlSession ss = factory.openSession(false); // auto commit false
    int modifyResult = ss.update(NS + "memberModify", dto);
    if(modifyResult == 1) {
      ss.commit();
    }
    ss.close();
    return modifyResult;
  }
  
  public int memberDelete(int memberNo) {
    SqlSession ss = factory.openSession(false);
    int deleteResult = ss.delete(NS + "memberDelete", memberNo);
    if(deleteResult == 1) {
      ss.commit();
    }
    ss.close();
    return deleteResult;
  }

}
