package com.groupware.orca.salary.dao;

import com.groupware.orca.salary.mapper.SalaryMapper;
import com.groupware.orca.salary.vo.ClientVo;
import com.groupware.orca.salary.vo.RatesVo;
import com.groupware.orca.salary.vo.SalaryVo;
import com.groupware.orca.user.vo.UserVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class SalaryDao {

    private final SalaryMapper mapper;

    public int salaryWrite(ClientVo clientVo, SalaryVo svo) {
        System.out.println("SalaryDao.salaryWrite");
        return mapper.salaryWrite(clientVo,svo);
    }

    //급여계산 4대보험 요율 가져오기
    public RatesVo getRatesVo() {
        return mapper.getRatesVo();
    }

    //급여계산 사원 정보 가져오기
    public UserVo getUserVo(int empNo) {
        return mapper.getUserVo(empNo);
    }

    public List<SalaryVo> getSalaryList() {
        System.out.println("SalaryDao.getSalaryList!!!!!!!!!!!~~~~~~~~~");
        return mapper.getSalaryList();
    }
    
    // 급여계산 상세조회
    public SalaryVo getSalaryByNo(String payrollNo) {
        return mapper.getSalaryByNo(payrollNo);
    }

    //급여계산 수정
    public int salaryUpdate(ClientVo clientVo, SalaryVo svo) {
        System.out.println("SalaryDao.salaryUpdate");

        return mapper.salaryUpdate(clientVo,svo);
    }

    //4대보험 입력
    public int ratesWrite(RatesVo vo) {
        return mapper.ratesWrite(vo);
    }

    //4대보험 수정
    public int ratesEdit(RatesVo rvo) {
        return mapper.ratesEdit(rvo);
    }

    public RatesVo getRatesByOne() {
        return mapper.getRatesByOne();
    }

    public int delete(String ratesNo) {
        return mapper.delete(ratesNo);
    }

    //급여 삭제
    public int getSalaryDelete(String payrollNo) {
        return mapper.getSalaryDelete(payrollNo);
    }

    //급여 검색
    public List<SalaryVo> searchSalary(String empNo) {
        return mapper.searchSalary(empNo);
    }



}
