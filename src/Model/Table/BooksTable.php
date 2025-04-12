<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;
use Cake\Event\EventInterface;
use ArrayObject;
use Cake\Datasource\EntityInterface;

class BooksTable extends Table
{
   
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('books');
        $this->setDisplayField('title');
        $this->setPrimaryKey('id');

        $this->addBehavior('Timestamp');

        $this->belongsTo('Publishers', [
            'foreignKey' => 'publisher_id',
        ]);
        $this->belongsTo('Authors', [
            'foreignKey' => 'author_id',
        ]);
    }


    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->scalar('title')
            ->maxLength('title', 255)
            ->requirePresence('title', 'create')
            ->notEmptyString('title');

        $validator
            ->integer('publisher_id')
            ->allowEmptyString('publisher_id');

        $validator
            ->integer('author_id')
            ->allowEmptyString('author_id');

        $validator
            ->date('published_date')
            ->allowEmptyDate('published_date');

        return $validator;
    }

 
    public function buildRules(RulesChecker $rules): RulesChecker
    {
        $rules->add($rules->existsIn('publisher_id', 'Publishers'), ['errorField' => 'publisher_id']);
        $rules->add($rules->existsIn('author_id', 'Authors'), ['errorField' => 'author_id']);

        return $rules;
    }

    public function beforeSave(EventInterface $event, EntityInterface $entity, ArrayObject $options)
    {
        if ($entity->isNew() && empty($entity->created_at)) {
            $entity->created_at = date('Y-m-d H:i:s');
        }
    }

    public function findPublished(Query $query, array $options)
    {
        return $query->where(['Books.status' => 'published']);
    }
}


