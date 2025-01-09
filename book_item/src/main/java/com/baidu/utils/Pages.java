package com.baidu.utils;

import java.util.ArrayList;
import java.util.List;

public class Pages {
    private Integer currentPage;//当前页
    private Integer pageSize;//页面容量
    private Integer totalCount;//总记录数
    private Integer totalPage;//总页数
    private Integer prePage;//上一页
    private Integer nextPage;//下一页

    private List<Integer> pageListNum;//页码

    public List<Integer> getPageListNum() {
        pageListNum = new ArrayList<>();
        for (int i = 0; i < getTotalPage(); i++) {
            pageListNum.add(i);
        }
        return pageListNum;
    }

    public void setPageListNum(List<Integer> pageListNum) {
        this.pageListNum = pageListNum;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    //    计算总页数
    public Integer getTotalPage() {
        if(getTotalCount()%getPageSize()==0){
            totalPage=getTotalCount()/getPageSize();
        }else {
            totalPage=getTotalCount()/getPageSize()+1;
        }
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    //    计算上一页
    public Integer getPrePage() {
        if(getCurrentPage()<=1){
            prePage=1;
        }else {
            prePage=getCurrentPage()-1;
        }
        return prePage;
    }

    public void setPrePage(Integer prePage) {
        this.prePage = prePage;
    }
    //计算下一页
    public Integer getNextPage() {
        if(getCurrentPage()>=getTotalPage()){
            nextPage=getTotalPage();
        }else {
            nextPage=getCurrentPage()+1;
        }
        return nextPage;
    }

    public void setNextPage(Integer nextPage) {
        this.nextPage = nextPage;
    }
}
