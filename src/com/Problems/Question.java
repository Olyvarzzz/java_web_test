package com.Problems;

public class Question {
private int proId;
private String proName;
private String proSelectA;
private String proSelectB;
private String proSelectC;
private String proSelectD;


public Question(int proId, String proName, String proSelectA, String proSelectB, String proSelectC, String proSelectD) {
	super();
	this.proId = proId;
	this.proName = proName;
	this.proSelectA = proSelectA;
	this.proSelectB = proSelectB;
	this.proSelectC = proSelectC;
	this.proSelectD = proSelectD;
}
@Override
public String toString() {
	return "Question [proId=" + proId + ", proName=" + proName + ", proSelectA=" + proSelectA + ", proSelectB="
			+ proSelectB + ", proSelectC=" + proSelectC + ", proSelectD=" + proSelectD + "]";
}
public int getProId() {
	return proId;
}
public void setProId(int proId) {
	this.proId = proId;
}
public String getProName() {
	return proName;
}
public void setProName(String proName) {
	this.proName = proName;
}
public String getProSelectA() {
	return proSelectA;
}
public void setProSelectA(String proSelectA) {
	this.proSelectA = proSelectA;
}
public String getProSelectB() {
	return proSelectB;
}
public void setProSelectB(String proSelectB) {
	this.proSelectB = proSelectB;
}
public String getProSelectC() {
	return proSelectC;
}
public void setProSelectC(String proSelectC) {
	this.proSelectC = proSelectC;
}
public String getProSelectD() {
	return proSelectD;
}
public void setProSelectD(String proSelectD) {
	this.proSelectD = proSelectD;
}

}