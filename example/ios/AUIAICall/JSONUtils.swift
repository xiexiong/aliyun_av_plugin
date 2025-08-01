//
//  JSONUtils.swift
//  Pods
//
//  Created by andy on 2025/8/1.
//



import Foundation

struct JSONUtils {
    /// JSON字符串转字典
    static func jsonToMap(jsonString: String) -> [String: Any]? {
        guard let data = jsonString.data(using: .utf8) else {
            print("字符串编码失败")
            return nil
        }
        
        do {
            let result = try JSONSerialization.jsonObject(
                with: data,
                options: .mutableContainers
            ) as? [String: Any]
            return result
        } catch {
            print("JSON解析错误: \(error.localizedDescription)")
            return nil
        }
    }
    
    /// 字典转JSON字符串
    static func mapToJson(dict: [String: Any]) -> String? {
        guard JSONSerialization.isValidJSONObject(dict) else {
            print("非法JSON对象")
            return nil
        }
        
        do {
            let data = try JSONSerialization.data(
                withJSONObject: dict,
                options: .prettyPrinted
            )
            return String(data: data, encoding: .utf8)
        } catch {
            print("JSON序列化错误: \(error.localizedDescription)")
            return nil
        }
    }
}
