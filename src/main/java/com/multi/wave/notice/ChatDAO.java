package com.multi.wave.notice;

import static com.mongodb.client.model.Filters.eq;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.springframework.stereotype.Repository;

import com.mongodb.Block;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

@Repository
public class ChatDAO {

    private MongoCollection<Document> festivalCollection;
    private MongoCollection<Document> showCollection;

    public ChatDAO(MongoClient mongoClient) {
        MongoDatabase database = mongoClient.getDatabase("wave");
        festivalCollection = database.getCollection("festival");
        showCollection = database.getCollection("show");
    }

    public List<ChatVO> findFestivalsByTheme(String theme) {
        List<ChatVO> results = new ArrayList<>();
        Block<Document> block = new Block<Document>() {
            @Override
            public void apply(final Document document) {
                results.add(new ChatVO(document));
            }
        };
        festivalCollection.find(eq("theme", theme)).forEach(block);
        return results;
    }

    public List<ChatVO> findRandomPerformancesByTheme(String theme, int limit) {
        List<ChatVO> results = new ArrayList<>();
        Block<Document> block = new Block<Document>() {
            @Override
            public void apply(final Document document) {
                results.add(new ChatVO(document));
            }
        };
        showCollection.find(eq("theme", theme)).limit(limit).forEach(block);
        return results;
    }
}
