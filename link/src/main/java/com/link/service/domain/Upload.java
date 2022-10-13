package com.link.service.domain;

public class Upload {
	
	private String fileNo;
	private int fileCount;
	private String fileName;
	private String filePath;
	private String fileOriginalName;
	
	public Upload() {
	}

	public Upload(int fileCount, String fileName, String filePath, String fileOriginalName) {
		super();
		this.fileCount = fileCount;
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileOriginalName = fileOriginalName;
	}

	public String getFileNo() {
		return fileNo;
	}

	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}

	public int getFileCount() {
		return fileCount;
	}

	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileOriginalName() {
		return fileOriginalName;
	}

	public void setFileOriginalName(String fileOriginalName) {
		this.fileOriginalName = fileOriginalName;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Upload [fileNo=");
		builder.append(fileNo);
		builder.append(", fileCount=");
		builder.append(fileCount);
		builder.append(", fileName=");
		builder.append(fileName);
		builder.append(", filePath=");
		builder.append(filePath);
		builder.append(", fileOriginalName=");
		builder.append(fileOriginalName);
		builder.append("]");
		return builder.toString();
	}

}
