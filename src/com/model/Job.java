package com.model;

public class Job {
    private Integer tJid;

    private String tJname;

    private String tJmarjor;

    private String tJplace;

    private String tJsalary;

    private String tJcount;

    private String tJcet;

    private String tJbody;

    private Integer uid;

    private String column11;

    private String column12;

    private String column13;

    public Integer gettJid() {
        return tJid;
    }

    public void settJid(Integer tJid) {
        this.tJid = tJid;
    }

    public String gettJname() {
        return tJname;
    }

    public void settJname(String tJname) {
        this.tJname = tJname == null ? null : tJname.trim();
    }

    public String gettJmarjor() {
        return tJmarjor;
    }

    public void settJmarjor(String tJmarjor) {
        this.tJmarjor = tJmarjor == null ? null : tJmarjor.trim();
    }

    public String gettJplace() {
        return tJplace;
    }

    public void settJplace(String tJplace) {
        this.tJplace = tJplace == null ? null : tJplace.trim();
    }

    public String gettJsalary() {
        return tJsalary;
    }

    public void settJsalary(String tJsalary) {
        this.tJsalary = tJsalary == null ? null : tJsalary.trim();
    }

    public String gettJcount() {
        return tJcount;
    }

    public void settJcount(String tJcount) {
        this.tJcount = tJcount == null ? null : tJcount.trim();
    }

    public String gettJcet() {
        return tJcet;
    }

    public void settJcet(String tJcet) {
        this.tJcet = tJcet == null ? null : tJcet.trim();
    }

    public String gettJbody() {
        return tJbody;
    }

    public void settJbody(String tJbody) {
        this.tJbody = tJbody == null ? null : tJbody.trim();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getColumn11() {
        return column11;
    }

    public void setColumn11(String column11) {
        this.column11 = column11 == null ? null : column11.trim();
    }

    public String getColumn12() {
        return column12;
    }

    public void setColumn12(String column12) {
        this.column12 = column12 == null ? null : column12.trim();
    }

    public String getColumn13() {
        return column13;
    }

    public void setColumn13(String column13) {
        this.column13 = column13 == null ? null : column13.trim();
    }
}