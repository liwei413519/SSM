package com.model;

public class Msg {
	//-----------自己增加静态变量
	public static int JOBE_POST_TYPE=1;//消息类型为岗位投递（求职者--->企业）
	public static int MSG_NOREAD=1;//消息未读
	public static int MSG_HASREAD=0;//消息已读
	//-----------自己增加部分结束
    protected Integer tMid;

    protected String tMhead;

    protected String tMpicture;

    protected String tMbody;

    protected String tMremark;

    protected String tMdate;

    protected Integer tMtype;

    protected Integer tMread;

    protected Integer tMstate;

    protected Integer tMfrom;

    protected Integer tMto;

    protected String column11;

    protected String column12;

    protected String column13;

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

    public String gettMdate() {
        return tMdate;
    }

    public void settMdate(String tMdate) {
        this.tMdate = tMdate == null ? null : tMdate.trim();
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

    public Integer gettMfrom() {
        return tMfrom;
    }

    public void settMfrom(Integer tMfrom) {
        this.tMfrom = tMfrom;
    }

    public Integer gettMto() {
        return tMto;
    }

    public void settMto(Integer tMto) {
        this.tMto = tMto;
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