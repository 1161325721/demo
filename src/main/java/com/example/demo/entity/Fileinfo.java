package com.example.demo.entity;


public class Fileinfo {

  private long fileid;
  private String filename;
  private String filetype;
  private long filesize;
  private String filedate;
  private String filestate;
  private long filescore;
  private String fileinfo;
  private long uid;
  private Userinfo userinfo;

  public Userinfo getUserinfo()
  {
    return userinfo;
  }

  public void setUserinfo(Userinfo userinfo)
  {
    this.userinfo = userinfo;
  }

  public long getFileid() {
    return fileid;
  }

  public void setFileid(long fileid) {
    this.fileid = fileid;
  }


  public String getFilename() {
    return filename;
  }

  public void setFilename(String filename) {
    this.filename = filename;
  }


  public String getFiletype() {
    return filetype;
  }

  public void setFiletype(String filetype) {
    this.filetype = filetype;
  }


  public long getFilesize() {
    return filesize;
  }

  public void setFilesize(long filesize) {
    this.filesize = filesize;
  }


  public String getFiledate() {
    return filedate;
  }

  public void setFiledate(String filedate) {
    this.filedate = filedate;
  }


  public String getFilestate() {
    return filestate;
  }

  public void setFilestate(String filestate) {
    this.filestate = filestate;
  }


  public long getFilescore() {
    return filescore;
  }

  public void setFilescore(long filescore) {
    this.filescore = filescore;
  }


  public String getFileinfo() {
    return fileinfo;
  }

  public void setFileinfo(String fileinfo) {
    this.fileinfo = fileinfo;
  }


  public long getUid() {
    return uid;
  }

  public void setUid(long uid) {
    this.uid = uid;
  }

  @Override
  public String toString()
  {
    return "Fileinfo{" + "fileid=" + fileid + ", filename='" + filename + '\'' + ", filetype='" + filetype + '\'' + ", filesize=" + filesize + ", filedate='" + filedate + '\'' + ", filestate='" + filestate + '\'' + ", filescore=" + filescore + ", fileinfo='" + fileinfo + '\'' + ", uid=" + uid + ", userinfo=" + userinfo + '}';
  }
}
