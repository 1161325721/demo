package com.example.demo.entity;


public class Loginfo {

  private long logid;
  private String uaccount;
  private String logdate;
  private String logevent;


  public long getLogid() {
    return logid;
  }

  public void setLogid(long logid) {
    this.logid = logid;
  }


  public String getUaccount() {
    return uaccount;
  }

  public void setUaccount(String uaccount) {
    this.uaccount = uaccount;
  }


  public String getLogdate() {
    return logdate;
  }

  public void setLogdate(String logdate) {
    this.logdate = logdate;
  }


  public String getLogevent() {
    return logevent;
  }

  public void setLogevent(String logevent) {
    this.logevent = logevent;
  }

}
