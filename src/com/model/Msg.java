package com.model;

import java.util.Date;

public class Msg {
    private Integer tMid;

    private String tMhead;

    private String tMpicture;

    private String tMbody;

    private String tMremark;

    private Date tMdate;

    private Integer tMtype;

    private Integer tMread;

    private Integer tMstate;

    private Integer uid;

    private String column11;

    private String column12;

    private String column13;

    public Integer gettMid() {
        return tMid;
    }

    public void settMid(Integer tMid) {
        this.tMid = tMid;
    }

    public String gettMhead() {
        return tMhead;
    }

    public void settMhead(String tMhead) {
        this.tMhead = tMhead == null ? null : tMhead.trim();
    }

    public String gettMpicture() {
        return tMpicture;
    }

    public void settMpicture(String tMpicture) {
        this.tMpicture = tMpicture == null ? null : tMpicture.trim();
    }

    public String gettMbody() {
        return tMbody;
    }

    public void settMbody(String tMbody) {
        this.tMbody = tMbody == null ? null : tMbody.trim();
    }

    public String gettMremark() {
        return tMremark;
    }

    public void settMremark(String tMremark) {
        this.tMremark = tMremark == null ? null : tMremark.trim();
    }

    public Date gettMdate() {
        return tMdate;
    }

    public void settMdate(Date tMdate) {
        this.tMdate = tMdate;
    }

    public Integer gettMtype() {
        return tMtype;
    }

    public void settMtype(Integer tMtype) {
        this.tMtype = tMtype;
    }

    public Integer gettMread() {
        return tMread;
    }

    public void settMread(Integer tMread) {
        this.tMread = tMread;
    }

    public Integer gettMstate() {
        return tMstate;
    }

    public void settMstate(Integer tMstate) {
        this.tMstate = tMstate;
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