package kr.co.dw.domain;

import java.util.List;

public class ReplyPageDTO {
  List<QnAReplyDTO> list;
  PageMakerDTO pageInfo;
  
  public List<QnAReplyDTO> getList() {
    return list;
  }
  
  public void setList(List<QnAReplyDTO> list) {
    this.list = list;
  }
  
  public PageMakerDTO getPageInfo() {
    return pageInfo;
  }
  
  public void setPageInfo(PageMakerDTO pageInfo) {
    this.pageInfo = pageInfo;
  }
  
  @Override
  public String toString() {
    return "ReplyPageDTO [list=" + list + ", pageInfo=" + pageInfo + "]";
  }
  
  
}
