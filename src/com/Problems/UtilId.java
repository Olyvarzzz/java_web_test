package com.Problems;

import java.util.UUID;

public class UtilId {
public static String getId(){
	UUID id=UUID.randomUUID();
	String ids=id.toString();
	ids=ids.replace("-", "");
	return ids;
}

public static int getIdNum() {
	int id=(int)(Math.random()*1000);
	return id;
}
}
