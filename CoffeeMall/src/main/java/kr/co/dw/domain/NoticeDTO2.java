package kr.co.dw.domain;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

public class NoticeDTO2 implements Serializable{
	private static final long serialVersionUID = 1L;
	
	
	private int nno;
	private String adminId;
	private String nTitle;
	private String nContent;
	private String nWritedate;
	private String nUpdatedate;
	private int readCnt;
	private List<String> filenameList;
	
	public NoticeDTO2() {
		// TODO Auto-generated constructor stub
	}
	
	public NoticeDTO2(int nno, String adminId, String nTitle, String nContent, String nWritedate, String nUpdatedate,
			int readCnt) {
		super();
		this.nno = nno;
		this.adminId = adminId;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nWritedate = nWritedate;
		this.nUpdatedate = nUpdatedate;
		this.readCnt = readCnt;
	}
	
	

	public NoticeDTO2(int nno, String adminId, String nTitle, String nContent, String nWritedate, String nUpdatedate,
			int readCnt, List<String> filenameList) {
		super();
		this.nno = nno;
		this.adminId = adminId;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nWritedate = nWritedate;
		this.nUpdatedate = nUpdatedate;
		this.readCnt = readCnt;
		this.filenameList = filenameList;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public String getadminId() {
		return adminId;
	}

	public void setadminId(String adminId) {
		this.adminId = adminId;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public String getnWritedate() {
		return nWritedate;
	}

	public void setnWritedate(String nWritedate) {
		this.nWritedate = nWritedate;
	}

	public String getnUpdatedate() {
		return nUpdatedate;
	}

	public void setnUpdatedate(String nUpdatedate) {
		this.nUpdatedate = nUpdatedate;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	
	

	public List<String> getFilenameList() {
		return filenameList;
	}

	public void setFilenameList(List<String> filenameList) {
		this.filenameList = filenameList;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(nno);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		NoticeDTO2 other = (NoticeDTO2) obj;
		return nno == other.nno;
	}

	@Override
	public String toString() {
		return "NoticeDTO [nno=" + nno + ", adminId=" + adminId + ", nTitle=" + nTitle + ", nContent=" + nContent
				+ ", nWritedate=" + nWritedate + ", nUpdatedate=" + nUpdatedate + ", readCnt=" + readCnt + "]";
	}

	

}
