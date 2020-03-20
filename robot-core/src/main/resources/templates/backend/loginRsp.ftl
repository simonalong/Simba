package ${packagePath}.web.vo.rsp;

import ${packagePath}.web.vo.AccountInfo;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.ArrayList;
import java.util.List;

/**
 * @author robot
 */
@Data
@Accessors(chain = true)
public class LoginRsp {

    /**
     * 用户的账户信息
     */
    private AccountInfo accountInfo;
    /**
     * 登录状态：ok：登录成功，error：账号不存在或者密码错误
     */
    private String status;
    /**
     * 权限
     */
    private List<String> currentAuthority = new ArrayList<>();

    public static LoginRsp build(AccountInfo accountInfo) {
        if (null != accountInfo) {
        return new LoginRsp().setAccountInfo(accountInfo).setStatus("ok");
        }
        return new LoginRsp().setStatus("error");
    }

    public static LoginRsp loginFail() {
        return new LoginRsp().setStatus("error");
    }
}