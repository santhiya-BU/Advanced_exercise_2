<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;


class Book extends Entity
{
        
    // protected $_accessible = [
    //     'title' => true,
    //     'publisher_id' => true,
    //     'author_id' => true,
    //     'published_date' => true,
    //     'created' => true,
    //     'modified' => true,
    //     'publisher' => true,
    //     'author' => true,
    // ];

    protected $_accessible = ['*' => true, 'id' => false];

    protected $_virtual = ['full_title'];

    protected function _getFullTitle()
    {
        $authorName = $this->author->name ?? 'Unknown Author';
        return $this->title . ' by ' . $authorName;
    }

    public function isPublished()
    {
        return $this->status === 'published';
    }
}
