package cn.itcast.report.utils;

import java.util.UUID;

//获取uuid
public class IdUtils {

	public static String getUUID() {

		return UUID.randomUUID().toString();

	}
}