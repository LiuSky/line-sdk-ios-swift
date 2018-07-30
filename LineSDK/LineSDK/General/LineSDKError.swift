//
//  LineSDKError.swift
//
//  Copyright (c) 2016-present, LINE Corporation. All rights reserved.
//
//  You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
//  copy and distribute this software in source code or binary form for use
//  in connection with the web services and APIs provided by LINE Corporation.
//
//  As with any software that integrates with the LINE Corporation platform, your use of this software
//  is subject to the LINE Developers Agreement [http://terms2.line.me/LINE_Developers_Agreement].
//  This copyright notice shall be included in all copies or substantial portions of the software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import Foundation

public enum LineSDKError: Error {
    
    public enum RequestErrorReason {
        case missingURL
        case lackOfAccessToken
        case jsonEncodingFailed(Error)
    }
    
    public enum ResponseErrorReason {
        case URLSessionError(Error)
        case nonHTTPURLResponse
        case dataParsingFailed(Error)
        case invalidHTTPStatusAuth(code: Int, error: AuthError, raw: String?)
        case invalidHTTPStatusAPI(code: Int, error: APIError, raw: String?)
        case invalidHTTPStatus(code: Int, raw: String?)
    }
    
    public enum AuthorizeErrorReason {
        case exhaustedLoginFlow
        case malformedHierarchy
        case userCancelled
        case callbackURLSchemeNotMatching
        case invalidSourceApplication
        case malformedRedirectURL(url: URL, message: String?)
        case invalidLineURLResultCode(String)
        case lineClientError(code: String, message: String?)
        case responseStateValueNotMatching(expected: String, got: String?)
        case webLoginError(error: String, description: String?)
        case keychainOperation(status: OSStatus)
        case invalidDataInKeychain
    }
    
    public enum GeneralErrorReason {
        case conversionError(string: String, encoding: String.Encoding)
    }
    
    case requestFailed(reason: RequestErrorReason)
    case responseFailed(reason: ResponseErrorReason)
    case authorizeFailed(reason: AuthorizeErrorReason)
    case generalError(reason: GeneralErrorReason)
}
