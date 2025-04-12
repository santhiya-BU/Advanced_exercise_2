<?php
declare(strict_types=1);

namespace App\Controller;

class BooksController extends AppController
{
    public function initialize(): void
    {
        parent::initialize();
        $this->loadModel('Books');
        $this->loadModel('Publishers');
        $this->loadModel('Authors');
        $this->loadComponent('Flash');
    }

    public $paginate = [
        'limit' => 10,
        'order' => [
            'Books.title' => 'asc'
        ]
    ];
    
    public function index()
    {
        // $this->Books->associations()->remove('Authors'); // This line for unbind the particular assosciations on Books.
        $books = $this->paginate(
            $this->Books->find()
                ->disableAutoFields()
                ->contain(['Authors', 'Publishers'])
        );
    
        // Paginate books by Authors from USA using matching()
        $usBooks = $this->paginate(
            $this->Books->find()
                ->matching('Authors', function ($q) {
                    return $q->where(['Authors.country' => 'USA']);
                })
        );
    
        // Paginate using custom finder
        $published = $this->paginate(
            $this->Books->find('published')
                ->contain(['Authors'])
        );
    
        $this->set(compact('books', 'usBooks', 'published'));
            
        
    }

 
    public function view($id = null)
    {
        $book = $this->Books->get($id, [
            'contain' => ['Publishers', 'Authors'],
        ]);

        $this->set(compact('book'));
    }

    public function add()
    {

        $book = $this->Books->newEmptyEntity();
        if ($this->request->is('post')) {
            $book = $this->Books->patchEntity($book, $this->request->getData(), [
                'associated' => ['Authors', 'Publishers']
            ]);
            if ($this->Books->save($book)) {
                $this->Flash->success('Book saved');
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The book could not be saved. Please, try again.'));
        }
        $publishers = $this->Books->Publishers->find('list', ['limit' => 200])->all();
        
        $authors = $this->Books->Authors->find('list', ['limit' => 200])->all();
        $this->set(compact('book', 'publishers', 'authors'));
        
    }

  
    public function edit($id = null)
    {
       
        $book = $this->Books->get($id, ['contain' => ['Authors', 'Publishers']]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $book = $this->Books->patchEntity($book, $this->request->getData());
            if ($this->Books->saveOrFail($book)) {
                $this->Flash->success('Book updated');
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The book could not be saved. Please, try again.'));
            }
            $publishers = $this->Books->Publishers->find('list', ['limit' => 200])->all();
            // print_r($publishers); exit;
            $authors = $this->Books->Authors->find('list', ['limit' => 200])->all();
            $this->set(compact('book', 'publishers', 'authors'));
        }

    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $book = $this->Books->get($id);
        if ($this->Books->delete($book)) {
            $this->Flash->success(__('The book has been deleted.'));
        } else {
            $this->Flash->error(__('The book could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
