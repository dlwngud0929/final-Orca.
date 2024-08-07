package com.groupware.orca.department.humanResources.personnelManagement.service;

import com.groupware.orca.common.vo.SearchVo;
import com.groupware.orca.department.humanResources.personnelManagement.dao.PersonnelManagementDao;
import com.groupware.orca.user.vo.UserVo;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PersonnelManagementService {
    private final PersonnelManagementDao dao;
    private final BCryptPasswordEncoder encoder;

    public List<List> getSelects() {
       return dao.getSelects();
    }

    public int employeeRegistration(UserVo newEmployeeVo) {
        String encPassword = encoder.encode(newEmployeeVo.getPassword());
        newEmployeeVo.setPassword(encPassword);
        return dao.employeeRegistration(newEmployeeVo);
    }

    public int getEmployeeCnt() {
        return dao.getEmployeeCnt();
    }

    public List<UserVo> listEmployeeData(int startNum, int endNum) {
        return dao.listEmployeeData(startNum, endNum);
    }

    public UserVo getEmployeeDetails(int empNo) {
        return dao.getEmployeeDetails(empNo);
    }

    public int updateEmployee(UserVo employeeVo) {
        return dao.updateEmployee(employeeVo);
    }


    public int deleteEmployee(int empNo) {
        return dao.deleteEmployee(empNo);
    }

    public int getSearchEmployeeCnt(SearchVo searchVo) {
        return dao.getSearchEmployeeCnt(searchVo);
    }

    public List<UserVo> searchListEmployeeData(String keyword, int startNum, int endNum, String searchType) {
        return dao.searchListEmployeeData(keyword, startNum, endNum, searchType);
    }
}
