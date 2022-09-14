package kr.co.dw.domain;

import java.io.Serializable;
import java.util.Objects;

public class QnAReplyDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int qno;
	private String replyText;
	private int rno;
	private String replyer;
	private String regDay;
	private String updateDay;

	public QnAReplyDTO() {
		// TODO Auto-generated constructor stub
	}

	public QnAReplyDTO(int qno, String replyText, int rno, String replyer, String regDay, String updateDay) {
		super();
		this.qno = qno;
		this.replyText = replyText;
		this.rno = rno;
		this.replyer = replyer;
		this.regDay = regDay;
		this.updateDay = updateDay;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getReplyText() {
		return replyText;
	}

	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public String getRegDay() {
		return regDay;
	}

	public void setRegDay(String regDay) {
		this.regDay = regDay;
	}

	public String getUpdateDay() {
		return updateDay;
	}

	public void setUpdateDay(String updateDay) {
		this.updateDay = updateDay;
	}

	@Override
	public int hashCode() {
		return Objects.hash(rno);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		QnAReplyDTO other = (QnAReplyDTO) obj;
		return rno == other.rno;
	}

	@Override
	public String toString() {
		return "QnAReplyDTO [qno=" + qno + ", replyText=" + replyText + ", rno=" + rno + ", replyer=" + replyer
				+ ", regDay=" + regDay + ", updateDay=" + updateDay + "]";
	}

}
