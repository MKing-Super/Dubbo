package pers.mk.mybatisplus.learn.tools;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

/**
 * @author MK
 * @Title: CodeGenerator
 * @Description: 代碼生成器:需要org.apache.velocity.context.Context
 * @date 2020/12/15
 */
public class CodeGenerator {
    public static void main(String [] args){
        AutoGenerator mpg = new AutoGenerator();

        //全局配置
        GlobalConfig gc = new GlobalConfig();
        //gc.setOutputDir("E:\\IdeaProjects\\examples_mybatis_plue\\demo01\\src\\main\\java");
        String path = System.getProperty("user.dir");
        path += "\\mybatis-plus\\src\\main\\java";    //当前项目的路径，与注释类型等同
        gc.setOutputDir(path);      //输出文件的路径
        gc.setFileOverride(false);  //是否覆盖旧代码
        gc.setActiveRecord(false);
        gc.setEnableCache(false);   //XML二级缓存
        gc.setBaseResultMap(true);
        gc.setBaseColumnList(false);
        gc.setAuthor("MK");         //作者姓名
        gc.setServiceName("%sService");         //业务层接口命名规则
        gc.setServiceImplName("%sServiceImpl"); //业务层实现类命名规则
        gc.setMapperName("%sMapper");           //映射接口命名规则
        gc.setXmlName("%sMapper");              //XML文件命名规则
        gc.setControllerName("%sController");   //控制层命名规则

        mpg.setGlobalConfig(gc);

        //数据源配置
        DataSourceConfig dsc=new DataSourceConfig();
        dsc.setDbType(DbType.MYSQL);
        dsc.setDriverName("com.mysql.cj.jdbc.Driver");
        dsc.setUsername("root");
        dsc.setPassword("123456");
        dsc.setUrl("jdbc:mysql://localhost:3306/dubbo_learn?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8");

        mpg.setDataSource(dsc);

        StrategyConfig strtegy = new StrategyConfig();
        strtegy.setNaming(NamingStrategy.underline_to_camel);
        strtegy.setInclude(new String[]{"dubbo_user"});   //数据库中的表名
        strtegy.setSuperServiceClass(null);
        strtegy.setSuperServiceImplClass(null);
        strtegy.setSuperMapperClass(null);

        mpg.setStrategy(strtegy);

        PackageConfig pc=new PackageConfig();
        pc.setParent("pers.mk.mybatisplus.learn.code");    //生成包的层级结构
        pc.setController("controller");
        pc.setService("service");
        pc.setMapper("mapper");
        pc.setEntity("po");
        pc.setXml("mapper.xml");
        mpg.setPackageInfo(pc);

        //执行生成代码
        mpg.execute();
    }
}
