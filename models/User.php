<?php

namespace app\models;
use Yii;
/**
 * This is the model class for table "users".
 *
 * @property integer $id
 * @property string $st_id
 * @property string $st_name
 * @property string $password
 * @property string $status
 * @property string $authKey
 * @property string $accessToken
 */
class User extends \yii\db\ActiveRecord  implements \yii\web\IdentityInterface {

    public static function tableName() {
        return 'users';
    }
    /**
 * @inheritdoc
 */
public function rules()
{
    return [
        [['st_id', 'st_name', 'password', 'status'], 'required'],
        [['st_id', 'st_name'], 'string', 'max' => 15],
        [['password', 'authKey', 'accessToken'], 'string', 'max' => 50],
        [['status'], 'string', 'max' => 10],
        [['st_id'], 'unique'],
    ];
}
    /**
     * @inheritdoc
     */
    public static function findIdentity($id) {
        $user = self::findById($id);
        if ($user) {
            return new static($user);
        }
        return null;
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null) {
        $user = User::find()->where(array('accessToken' => $token))->one();
        if ($user) {
            return new static($user);
        }
        return null;
    }

    /**
     * Finds user by username
     *
     * @param  string      $username
     * @return static|null
     */
    public static function findByUsername($username) {
        $user = User::find()->where(array('st_id' => $username))->one();
        if ($user) {
            return new static($user);
        }

        return null;
    }

    public static function findById($id) {
        $user = User::find()->where(array('id' => $id))->asArray()->one();
        if ($user) {
            return new static($user);
        }

        return null;
    }

    /**
     * @inheritdoc
     */
    public function getId() {
        return $this->id;
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey() {
        return $this->authKey;
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey) {
        return $this->authKey === $authKey;
    }

    /**
     * Validates password
     *
     * @param  string  $password password to validate
     * @return boolean if password provided is valid for current user
     * 在创建用户的时候，也需要对密码进行操作
     */
    public function validatePassword($password) {
        //方法一:使用自带的加密方式
        return $this->password === md5($password);

        //方法二：通过YII自带的验证方式来验证hash是否正确
        //return Yii::$app->getSecurity()->validatePassword($password, $this->password);
    }

}
