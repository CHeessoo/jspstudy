package repository;

import org.apache.ibatis.session.SqlSessionFactory;

public class MemberDao {
  
  private SqlSessionFactory factory;
  
  private static MemberDao dao = new MemberDao(); 
  private MemberDao() {
    
  }
  public static MemberDao getDao() {
    return dao;
  }
  

}
