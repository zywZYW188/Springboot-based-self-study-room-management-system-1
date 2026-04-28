# 基于 Spring Boot 的自习室管理系统

## 一、项目介绍

本项目是一款基于 **Spring Boot + Vue** 的自习室预约管理系统，面向高校自习室场景，提供完整的座位预约、自习室管理、公告发布与学生管理功能。系统采用前后端分离架构，后端提供 RESTful API，前端使用 Vue 与 HTML 进行页面渲染。

### 角色与功能

| 角色 | 功能 |
|------|------|
| **管理员** | 自习室管理、座位预约审核、公告管理、学生管理、留言回复、在线客服 |
| **学生** | 注册/登录、浏览自习室、预定座位、查看公告、留言、在线客服咨询 |

---

## 二、项目技术栈

### 后端技术

| 技术 | 版本 | 说明 |
|------|------|------|
| Spring Boot | 2.2.2.RELEASE | 核心应用框架 |
| MyBatis | 2.1.1 | ORM 持久层框架 |
| MyBatis-Plus | 2.3 | 增强 CRUD、分页插件 |
| Shiro | 1.3.2 | 权限控制框架 |
| MySQL Connector | 8.0.13 | 数据库驱动 |
| FastJSON | 1.2.8 | JSON 序列化 |
| Hutool | 4.0.12 | Java 工具类库 |
| Apache Commons Lang3 | 3.0 | 常用工具类 |

### 前端技术

| 技术 | 说明 |
|------|------|
| Vue.js | 前端框架 |
| Element UI | 组件库 |
| Layui | UI 框架 |
| HTML / CSS / JavaScript | 页面构建 |

---

## 三、开发环境

- **JDK**：1.8（推荐）
- **数据库**：MySQL 5.7 / 8.x
- **IDE**：IntelliJ IDEA / Eclipse
- **构建工具**：Maven
- **操作系统**：Windows
- **Tomcat**：内置，无需额外配置

---

## 四、项目结构

```
src/main/java/com/
├── annotation/          # 自定义注解（@IgnoreAuth、@LoginUser 等）
├── config/              # Spring 配置类
├── controller/          # 控制器层（REST API）
├── dao/                 # 数据访问层（Mapper 接口）
├── entity/              # 实体类（含 Model/VO/View）
├── interceptor/         # 拦截器（Token 认证）
├── service/             # 业务层
│   └── impl/            # 业务实现
├── utils/               # 工具类
└── SpringbootSchemaApplication.java  # 应用入口

src/main/resources/
├── mapper/              # MyBatis XML 映射文件
├── front/               # 前端静态资源（Vue 页面）
├── static/              # 静态资源
└── application.yml      # 应用配置文件
```

---

## 五、数据库配置

### 5.1 创建数据库

执行以下 SQL 创建数据库（或直接使用项目中的初始化脚本）：

```sql
CREATE DATABASE IF NOT EXISTS zixishi
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
```

> 完整建表脚本位于：`.qoder/repowiki/zh/content/数据模型设计/schema.sql`

### 5.2 配置 application.yml

编辑 `src/main/resources/application.yml`，修改数据库连接信息：

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/zixishi?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true
    username: root
    password: 123456        # 请修改为你的 MySQL 密码
    driver-class-name: com.mysql.cj.jdbc.Driver
```

---

## 六、启动项目

### 6.1 使用 IDE 启动

1. 使用 IntelliJ IDEA 打开项目
2. 等待 Maven 自动下载依赖
3. 运行 `SpringbootSchemaApplication.java` 中的 `main` 方法
4. 访问后端接口：`http://localhost:8080`
5. 访问前端页面：`http://localhost:8080/front/front/index.html`

### 6.2 使用 Maven 命令启动

```bash
mvn spring-boot:run
```

### 6.3 打包部署

```bash
mvn clean package
java -jar target/springboot3fy99-0.0.1-SNAPSHOT.jar
```

---

## 七、默认账号

| 角色 | 账号 | 密码 |
|------|------|------|
| 管理员 | `admin` | `admin` |

> 学生账号需在前端注册页面自行注册。

---

## 八、核心功能模块

| 模块 | 说明 |
|------|------|
| 自习室管理 | 管理员维护自习室信息、座位总数与设施配置 |
| 座位预约 | 学生选择自习室与座位号提交预约，系统实时更新座位占用状态 |
| 预约审核 | 管理员查看与审核座位预约记录 |
| 公告管理 | 管理员发布公告，学生可浏览查看 |
| 学生管理 | 管理员维护学生账号信息 |
| 留言板 | 学生留言，管理员回复 |
| 在线客服 | 学生提问，管理员在线答疑 |

---

## 九、系统设计文档

项目相关技术文档已统一存放在 `.qoder/repowiki/` 目录下：

| 文档 | 路径 |
|------|------|
| 系统架构设计 | `.qoder/repowiki/zh/content/系统架构设计.md` |
| 数据模型设计 | `.qoder/repowiki/zh/content/数据模型设计/` |
| 数据库建表语句 | `.qoder/repowiki/zh/content/数据模型设计/数据库建表语句.md` |
| 数据库初始化脚本 | `.qoder/repowiki/zh/content/数据模型设计/schema.sql` |
| API 接口文档 | `.qoder/repowiki/zh/content/API接口文档/` |
| 核心功能模块 | `.qoder/repowiki/zh/content/核心功能模块/` |

