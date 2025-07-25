package dao;

import java.util.List;
import java.util.Map;

import model.dto.BoardDTO;
import model.dto.UserDTO;

public class Main {

  public static void main(String[] args) {
    
    BoardDao dao = BoardDao.getInstance();
    
    int bid = 1;
    System.out.println("단일 조회: " + dao.getBoardById(bid));
    
    System.out.println();
    
    System.out.println("조회 함수처리: " + dao.getBoardCount());
    
    System.out.println();
    
    String sort = "ASC";
    for(BoardDTO board : dao.getBoards(sort)) {
      System.out.println("리스트 조회: " + board);
    }
    System.out.println();
    Map<String, Object> map = Map.of("target", "content", "query", "입니다.");
    
    List<BoardDTO> foundBoard = dao.findBoardsUsingQuery(map);
    for(BoardDTO board : foundBoard) {
      System.out.println("검색결과: " + board);
    }
    System.out.println();
    Map<String, Object> map1 = Map.of("beginDate", "2025-07-24", "endDate", "2025-07-24");
     for(BoardDTO foundBoard1 : dao.findBoardsUsingDate(map1)) {
       System.out.println("검색결과(날짜): " + foundBoard1);
     }
     System.out.println();
     
     Map<String, Object> map2 = Map.of(
         "target", "title",
         "query", "상어",
         "beginDate", "2025-07-24",
         "endDate", "2025-07-24"
         );
     for(BoardDTO foundBoard2 : dao.findBoards1(map2)) {
       System.out.println("검색결과(통합1): " + foundBoard2);
     }
     System.out.println();
     Map<String, Object> map3 = Map.of(
         "title", "",
         "content", "나는",
         "beginDate", "2025-07-24",
         "endDate", "2025-07-24"
         );
     for(BoardDTO foundBoard3 : dao.findBoards2(map3)) {
       System.out.println("검색결과(통합2): " + foundBoard3);
     }
    
  }

}
