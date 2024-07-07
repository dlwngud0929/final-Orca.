package com.groupware.orca.board.service;

import com.groupware.orca.board.dao.BoardDao;
import com.groupware.orca.board.vo.BoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardDao dao;

    public BoardVo getBoardDetail(int boardNo) {
        BoardVo boardVo = dao.getBoardDetail(boardNo);
        if ("Y".equals(boardVo.getIsAnonymous())) {  // null 체크 및 익명 처리
            boardVo.setEmployeeName("***");
        }
        return boardVo;
    }

    public int boardInsert(BoardVo vo) {
        return dao.boardInsert(vo);
    }

    public int boardUpdate(BoardVo vo) {
        return dao.boardUpdate(vo);
    }

    public int boardDelete(int boardNo) {
        return dao.boardDelete(boardNo);
    }

    public List<BoardVo> searchBoard(String title, int categoryNo, int page, int rows) {
        int offset = (page - 1) * rows;
        return dao.searchBoard(title, categoryNo, offset, rows);
    }

    public int getSearchCount(String title, int categoryNo) {
        return dao.getSearchCount(title, categoryNo);
    }

    public void hit(int boardNo) {
        dao.hit(boardNo);
    }

    public List<BoardVo> getBoardList(int categoryNo, int page, int rows) {
        int offset = (page - 1) * rows;
        List<BoardVo> boardList = dao.getBoardList(categoryNo, offset, rows);
        for (BoardVo board : boardList) {
            if ("Y".equals(board.getIsAnonymous())) {  // null 체크 및 익명 처리
                board.setEmployeeName("***");
            }
        }
        return boardList;
    }

    public int getBoardCount(int categoryNo) {
        return dao.getBoardCount(categoryNo);
    }

    public List<Map<String, Object>> getStatsByDate() {
        return dao.getStatsByDate();
    }
}

