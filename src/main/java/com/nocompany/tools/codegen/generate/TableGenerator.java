package com.nocompany.tools.codegen.generate;

import com.nocompany.tools.codegen.initialize.TableInitializer;
import com.nocompany.tools.codegen.model.Table;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TableGenerator {

    /* 日志类 */
    private static final Logger logger = LoggerFactory.getLogger(TableGenerator.class);


    @Autowired
    TableInitializer tableInitializer;

    private Map<String, String> generateParam;


    Configuration cfg;
    public void init(String templatePath) throws IOException {
        cfg = new Configuration();
        cfg.setDirectoryForTemplateLoading(new File(templatePath));
        cfg.setObjectWrapper(new DefaultObjectWrapper());
    }


    public void generate(Table table, Map<String, String> generateParam) throws Exception {
        this.generateParam = generateParam;
        String ftlDir = generateParam.get("ftlDir");

        @SuppressWarnings("unchecked")
        Collection<File> files = (Collection<File>) FileUtils.listFiles(new File(ftlDir), new String[]{"ftl"} , true);
        Iterator<File> it = files.iterator();
        while( it.hasNext() ){
            File ftlFile = it.next();
            gen(table, ftlFile);
        }
    }


    public void gen(Table t, File ftlFile) throws Exception {
        String ftlPath = FilenameUtils.getFullPath(ftlFile.getAbsolutePath());
        String ftlName = FilenameUtils.getBaseName(ftlFile.getName());

        String templateName = ftlFile.getName();
        String outputPath = ftlPath.replaceFirst("templates", "target");
        String outputName = ftlName.replaceAll("[_]", t.NameFU);

        File outputDir = new File(outputPath);
        if(!outputDir.exists()) {
            outputDir.mkdirs();
        }

        Writer out = null;
        try {
            Map<String,Object> data = initData(t);
            out = new OutputStreamWriter(new FileOutputStream(outputPath + outputName), "UTF-8");

            init(ftlPath);
            logger.info("生成文件: {}", ftlPath);
            Template template = cfg.getTemplate(templateName, "UTF-8");// 模板对象
            template.process(data, out);
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            out.flush();
        }
    }


    public Map<String,Object> initData(Table t) {
        Map<String,String> table = new HashMap<>();
        table.put("Schema", t.getSchema());
        table.put("Name", t.getName());
        table.put("NameFL", t.NameFL);
        table.put("NameFU", t.NameFU);
        table.put("comments", t.comments);

        Map<String,Object> root = new HashMap<>();
        root.put("param", generateParam);
        root.put("table", table);
        root.put("columns", t.getColumnList());
        return root;
    }
}
